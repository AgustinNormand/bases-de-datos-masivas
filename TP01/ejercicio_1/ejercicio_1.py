import psycopg2
from psycopg2 import Error
import pandas as pd
import Levenshtein as lev

class Migrator():
    def __init__(self):
        self.connect_to_database()
        self.read_excel_file()
        self.read_required_files()
        #self.migrate_provincias()
        #self.migrate_tipos_de_medio()
        #self.migrate_especialidades()
        #self.migrate_ciudades()
        self.migrate_medios()

    def connect_to_database(self):
        self.connection = psycopg2.connect(user="postgres",
                                           password="postgres",
                                           host="127.0.0.1",
                                           port="5470",
                                           database="medios")
        self.cursor = self.connection.cursor()

    def read_excel_file(self):
        input_file = pd.ExcelFile(r"/home/agustin/Desktop/Bases_de_datos_masivas/repo-propio/TP01/ejercicio_1/input_files/01-01-Medios.xls")
        self.medios = input_file.parse(input_file.sheet_names[0])

    def read_required_files(self):
        self.input_provincias = pd.read_csv("/home/agustin/Desktop/Bases_de_datos_masivas/repo-propio/TP01/ejercicio_1/input_files/provincias/provincias.csv").iso_nombre
        self.input_tipos_de_medio = pd.read_csv("/home/agustin/Desktop/Bases_de_datos_masivas/repo-propio/TP01/ejercicio_1/input_files/tipos_de_medios/tipos_de_medios.csv").tipo_de_medio
        self.input_preprocessing_especialidades = pd.read_csv("/home/agustin/Desktop/Bases_de_datos_masivas/repo-propio/TP01/ejercicio_1/input_files/especialidades/especialidades_pre_procesamiento.csv").Especialidad
        self.input_ciudades = pd.read_csv("/home/agustin/Desktop/Bases_de_datos_masivas/repo-propio/TP01/ejercicio_1/input_files/ciudades/localidades_modified.csv").Ciudad


    def find_closest_match(self, target, lookup, treshold):
        for value in lookup:
            distance = lev.distance(target.lower(), value.lower())
            if distance <= treshold:
                return value
        print("Value not matched->"+target)

    ##

    def migrate_provincias(self):
        processed_provincias_list = []
        for provincia in self.medios.Provincia.unique():
            processed_provincia = self.process_provincia(provincia)
            if (processed_provincia not in processed_provincias_list) and (processed_provincia != None):
                processed_provincias_list.append(processed_provincia)
        self.insert_provincias(processed_provincias_list)

    def process_provincia(self, provincia):
        procesed_provincia = self.find_closest_match(provincia, self.input_provincias, 2)
        return procesed_provincia
    
    def insert_provincias(self, provincias):
        insert_query = """ INSERT INTO provincias (nombre) VALUES ('{}')"""
        for provincia in provincias:
            self.cursor.execute(insert_query.format(provincia))
        self.connection.commit()

    ##

    def migrate_tipos_de_medio(self):
        processed_tipos_de_medio_list = []
        for tipo_de_medio in self.medios['Tipo de medio'].unique():
            processed_tipo_de_medio = self.process_tipo_de_medio(tipo_de_medio)
            if (processed_tipo_de_medio not in processed_tipos_de_medio_list) and (processed_tipo_de_medio != None):
                processed_tipos_de_medio_list.append(processed_tipo_de_medio)
        self.insert_tipos_de_medio(processed_tipos_de_medio_list)

    def process_tipo_de_medio(self, tipo_de_medio):
        if tipo_de_medio == "R":
            tipo_de_medio = "Radio"
        procesed_tipo_de_medio = self.find_closest_match(tipo_de_medio, self.input_tipos_de_medio, 2)
        return procesed_tipo_de_medio
    
    def insert_tipos_de_medio(self, tipos_de_medio):
        insert_query = """ INSERT INTO tipos_medio (descripcion) VALUES ('{}')"""
        for tipo_de_medio in tipos_de_medio:
            self.cursor.execute(insert_query.format(tipo_de_medio))
        self.connection.commit()

    ##

    def migrate_especialidades(self):
        processed_especialidades_list = []
        for especialidad in self.medios['Especialidad'].unique():
            processed_especialidad = self.process_especialidad(especialidad)
            if (processed_especialidad not in processed_especialidades_list) and (processed_especialidad != None):
                processed_especialidades_list.append(processed_especialidad)
        self.insert_especialidades(processed_especialidades_list)

    def process_especialidad(self, especialidad):
        if especialidad == "Musica  ":
            especialidad = "Musica"
        procesed_especialidad = self.find_closest_match(especialidad, self.input_preprocessing_especialidades, 2)
        procesed_especialidad = self.map_values_especialidad(procesed_especialidad)
        #return procesed_especialidad
        return procesed_especialidad

    def map_values_especialidad(self, especialidad):
        if especialidad == "Agro":
            especialidad = "Agropecuario"
        if especialidad == "Agroindustria":
            especialidad = "Agropecuario"
        if especialidad == "Automovilismo":
            especialidad = "Automóviles"
        if especialidad == "Consumidores":
            especialidad = "Consumo"            
        if especialidad == "Cultura":
            especialidad = "Cultural y Musical"
        if especialidad == "Exparcimiento":
            especialidad = "Esparcimiento"
        if especialidad == "Guia de Cursos":
            especialidad = "Guía"
        if especialidad == "Turismo y gral":
            especialidad = "Turismo"
        if especialidad == "Ciencia/Salud":
            especialidad = "Salud/Ciencia"
        return especialidad
    
    def insert_especialidades(self, especialidades):
        insert_query = """ INSERT INTO especialidades (descripcion) VALUES ('{}')"""
        for especialidad in especialidades:
            self.cursor.execute(insert_query.format(especialidad))
        self.connection.commit()

    ##

    def migrate_ciudades(self):
        processed_ciudades_provincias_list = []
        for ciudad, provincia in zip(self.medios['Ciudad'], self.medios['Provincia']):
            processed_ciudad = self.process_ciudad(ciudad)
            if (processed_ciudad != None):
                processed_provincia = self.process_provincia(provincia)
                if (processed_provincia != None) and ([processed_ciudad, processed_provincia] not in processed_ciudades_provincias_list):    
                    processed_ciudades_provincias_list.append([processed_ciudad, processed_provincia])
        self.insert_ciudades(processed_ciudades_provincias_list)

    def process_ciudad(self, ciudad):
        if pd.isna(ciudad):
            ciudad = "*"
        procesed_ciudad = self.find_closest_match(ciudad, self.input_ciudades, 2)
        return procesed_ciudad
    
    def insert_ciudades(self, ciudades):
        insert_query = """ INSERT INTO ciudades (nombre, id_provincia) VALUES ('{}', '{}')"""
        for ciudad, provincia in ciudades:
            id_provincia = self.select_provincia(provincia)
            self.cursor.execute(insert_query.format(ciudad, id_provincia))
            self.connection.commit()

    ##

    def select_especialidad(self, especialidad):
        select_query = """ SELECT id from especialidades where descripcion = '{}'"""
        self.cursor.execute(select_query.format(especialidad))
        return self.cursor.fetchone()[0]

    def select_provincia(self, provincia):
        select_query = """ SELECT id from provincias where nombre = '{}'"""
        self.cursor.execute(select_query.format(provincia))
        return self.cursor.fetchone()[0]

    def select_tipo_de_medio(self, tipo_de_medio):
        select_query = """ SELECT id from tipos_medio where descripcion = '{}'"""
        self.cursor.execute(select_query.format(tipo_de_medio))
        return self.cursor.fetchone()[0]
    
    def select_ciudad(self, ciudad):
        select_query = """ SELECT id from ciudades where nombre = '{}'"""
        self.cursor.execute(select_query.format(ciudad))
        return self.cursor.fetchone()[0]

    def migrate_medios(self):
        processed_medios_list = []
        for index, row in self.medios.iterrows():
            processed_especialidad = self.process_especialidad(row['Especialidad'])
            id_especilidad = self.select_especialidad(processed_especialidad)
            processed_tipo_de_medio = self.process_tipo_de_medio(row['Tipo de medio'])
            id_tipo_de_medio = self.select_tipo_de_medio(processed_tipo_de_medio)
            processed_ciudad = self.process_ciudad(row['Ciudad'])
            id_ciudad = self.select_ciudad(processed_ciudad)
            nombre_medio = row['Medio']
            if (type(nombre_medio) == str):
                nombre_medio = nombre_medio.replace("'", "")
            direccion = row['Dirección']
            if (type(direccion) == str):
                direccion = direccion.replace("'", "")
            self.insert_medios(nombre_medio, direccion, id_especilidad, id_tipo_de_medio, id_ciudad)

    def insert_medios(self, nombre_medio, direccion, id_especialidad, id_tipo_de_medio, id_ciudad):
        insert_query = """ INSERT INTO medios (nombre, direccion, id_especialidad, id_tipo_medio, id_ciudad) VALUES ('{}', '{}', '{}', '{}', '{}')"""
        self.cursor.execute(insert_query.format(nombre_medio, direccion, id_especialidad, id_tipo_de_medio, id_ciudad))
        self.connection.commit()

if __name__== '__main__':
    Migrator()