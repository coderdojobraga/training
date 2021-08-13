#!/usr/bin/env python
"""
Questões sobre Listas
=====================

As listas são usadas para armazenar vários elementos numa única variável.
Fazendo parte de uma das 4 estruturas de dados built-in na linguagem Python
utilizadas para guardar coleções de dados. As restantes estruturas são o
Conjunto, o Túplo e o Dicionário.
"""


def enum_from_to(a: int, b: int) -> list[int]:
    """
    Constrói a lista dos números inteiros compreendidos entre dois limites.

    Exemplos
    --------

    >>> enum_from_to(1, 5)
    [1, 2, 3, 4, 5]
    >>> enum_from_to(1, 1)
    [1]
    """
    result = []

    i = a

    while i <= b:
        result.append(i)
        i = i + 1

    return result


def reverse(a: list) -> list:
    """
    Calcula a lista inversa.

    Exemplos
    --------

    >>> reverse([10, 20, 30])
    [30, 20, 10]

    >>> reverse([5, 8, 3, 9])
    [9, 3, 8, 5]

    >>> reverse([])
    []
    """
    result = []

    i = len(a) - 1

    while not i < 0:
        result.append(a[i])
        i -= 1

    return result


def is_elem(elem, values: list) -> bool:
    """
    Verifica se um elemento existe numa lista.

    Exemplos
    --------

    >>> is_elem(20, [10, 20, 30])
    True
    >>> is_elem(2, [10, 20, 30])
    False
    """
    for value in values:
        if value == elem:
            return True

    return False


def maximum(values: list[int]) -> int:
    """
    Retorna o valor máximo.

    Exemplos
    --------

    >>> maximum([50, 20, 30])
    50
    >>> maximum([20, 78, 32, 40])
    78
    >>> maximum([20, 12, 55, 90, 18])
    90
    >>> maximum([0])
    0
    """
    result = values[0]

    for value in values:
        if value > result:
            result = value

    return result


def sums(values: list[int]) -> list[int]:
    """
    Calcula as somas acumuladas.

    Exemplos
    --------

    >>> sums([10, 20, 30])
    [10, 30, 60]
    >>> sums([3, 3, 3])
    [3, 6, 9]
    >>> sums([1, 2, 3, 4])
    [1, 3, 6, 10]
    >>> sums([5, 2, 1, 7])
    [5, 7, 8, 15]
    """
    results = []

    aux = 0
    for value in values:
        aux += value
        results.append(aux)

    return results
