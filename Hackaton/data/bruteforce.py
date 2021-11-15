import pandas as pd 

from sklearn import tree
from sklearn.model_selection import train_test_split
from sklearn import metrics 
from sklearn import preprocessing

#import graphviz

import numpy as np
#import seaborn as sns; sns.set()
#import matplotlib.pyplot as plt
import random

def get_features():
  feature_names_disponibles = feature_names.copy()
  feature_names_elegidas = []
  cantidad_de_variables_a_usar = random.randint(2,17)
  for i in range(cantidad_de_variables_a_usar):
    random_feature = random.choice(feature_names_disponibles)
    feature_names_elegidas.append(random_feature)
    feature_names_disponibles.remove(random_feature)
  return feature_names_elegidas

def get_data(random_features):
    return data[random_features]

def get_criterion():
    return random.choice(['gini', 'entropy'])

def get_max_depth():
     return random.randint(1,38)

def get_min_samples_leaf():
     return random.randint(1,50)

def get_train_size():
    #return round(random.uniform(0.1, 0.4), 2)
    return 0.2

def get_splitter():
    return random.choice(['best', 'random'])

def get_min_samples_split():
    return random.randint(2,5)

def get_min_weight_fraction_leaf():
    return round(random.uniform(0, 0.5), 2)

def get_class_weight():
    #return random.choice(['balanced', None])
    return "balanced"

def get_max_features():
    return random.choice(['auto', 'sqrt', 'log2', None])

if __name__=='__main__':
    data = pd.read_csv("dataset_2.csv", delimiter=",") 
    features_to_remove = ["Stay"]
    feature_names = list(data.columns)
    for feature_to_remove in features_to_remove:
        feature_names.remove(feature_to_remove)
    features = data[feature_names]
    le = preprocessing.LabelEncoder()
    le.fit(data.Stay)
    target_names = le.classes_
    target = data.Stay

    max_accuracy = 0

    while True:
        criterion = get_criterion()
        train_size = get_train_size()
        max_depth = get_max_depth()
        splitter = get_splitter()
        min_samples_leaf = get_min_samples_leaf()
        min_samples_split = get_min_samples_split()
        min_weight_fraction_leaf = get_min_weight_fraction_leaf()
        class_weight = get_class_weight()
        random_features = get_features()
        max_features = get_max_features()
        features = get_data(random_features)

        X_train, X_test, y_train, y_test = train_test_split(features, target, random_state=0, test_size=train_size)

        arbol_parametrizado = tree.DecisionTreeClassifier(criterion=criterion, max_depth=max_depth, min_samples_leaf=min_samples_leaf, splitter = splitter, min_weight_fraction_leaf=min_weight_fraction_leaf, class_weight=class_weight, max_features=max_features)
        arbol_parametrizado = arbol_parametrizado.fit(X_train,y_train)
        y_pred = arbol_parametrizado.predict(X_test)

        accuracy = metrics.accuracy_score(y_test, y_pred)

        if accuracy > max_accuracy:
            max_accuracy = accuracy
            print("New max accuracy found ({}), features: {}, criterion: {}, max_depth: {}, min_samples_leaf: {}, train_size: {}, splitter: {}, min_samples_split: {}, min_weight_fraction_leaf: {}, class_weight: {}, max_features:{}".format(accuracy, random_features, criterion, max_depth, min_samples_leaf, train_size, splitter, min_samples_split, min_weight_fraction_leaf, class_weight, max_features))
            print("")
