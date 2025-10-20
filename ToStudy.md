# Les choses à revoir pour Python

## La POO

[**Sur ce lien**](https://www.notion.so/Oriented-Object-Programming-02e4ef8894fb4810b8c85f968efc2c15?source=copy_link),
tu trouveras les design pattern avec des exemples en python

## Comment fonctionne Python

### Compilation VS Interpretation VS JIT (Just in Time)

- Savoir ce que ça veut dire que python est un langage interprété et non compilé
- Savoir ce qu'est le JIT et les avantages et inconvenient (librairie Numba)

### Multiprocessing vs Multithreading vs Asynchrone

- Bien comprendre les différences entre Multiprocessing vs Multithreading vs Asynchrone
    - [**Ce lien t'aidera**](https://www.notion.so/Parallelism-Concurrency-2884b292ba1845f4b58df0ac57f509da?source=copy_link)
- Quelle est la différence entre un process et un thread ?
- En python, c'est quoi le GIL ? Et qu'est-ce que ça empêche de faire ?

## Spécificité du langage

### Mutabilité et immutabilité en python

- Savoir ce qu'est la Mutabilité et immutabilité en python
- les types qui sont concernés par l'un et l'autre
- Savoir pourquoi ça pose pb:

```python
def build_list(input_list: list = []):
    ...
```

### Hash et Dictionnaire

- Pourquoi les dictionnaires sont efficaces en accès ?
- Comment un objet peut être utilisé comme clef de dictionnaire (`__hash__`)
- Et les `set()` ?

### Decorateur

- comment les utiliser ? (`sur les fonctions et classes`)
- comment les créer ? (`functools.wrapper`)

### Importation

- Savoir comment fonctionne l'importation
- Savoir qu'avant que le code passe dans l'entrée principale, il complète la phase d'importation
- C'est quoi `__ini__.py`
- Bonus : C'est quoi les namespaces

### Iterateur

- Comment les utiliser
- Comment les creer (`itertools`,`__iter__`, `yield`)
- Qu'est-ce que c'est que les listes par compréhension ? dictionnaire par comprehension ?
    - C'est plus ou moins performant ?

### Context Manager

- Comment les utiliser
- Comment les créer (par une classe (`__enter__`, `__exit__`) ou par une fonction (`from contextlib import contextmanager`))

### Dunder methods

- C'est quoi les method dunder builtin ?
- ça fait quoi de commencer par un "_" pour nommer une fonction ou une variable ?

### Savoir utiliser les formats strings
```python
for align, text in zip('<^>', ['left', 'center', 'right']):
    print('{0:{fill}{align}16}'.format(text, fill=align, align=align))
# Output
# 'left<<<<<<<<<<<<'
# '^^^^^center^^^^^'
# '>>>>>>>>>>>right'
```

### Savoir les améliorations
- Quelques exemples d'amélioration de 3.8 à 3.14
- Quelques différences entre 2.7 et 3.X

## Librairies
### Data
- Visualization: matplotlib,(plus moderne: seaborn), ...
- Math: numpy, scikit-learn, ...
- Data manipulation: pandas, (plus modern: polars), ...

### Front End
- Django
- Flask
- uvicorn
- FastAPI
- ...