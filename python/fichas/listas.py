#!/usr/bin/env python
"""
# Ficha x: Questões sobre Listas

As listas são usadas para armazenar vários elementos numa única variável.
Fazendo parte de uma das 4 estruturas de dados built-in na linguagem Python
utilizadas para guardar coleções de dados. As restantes estruturas são o
Conjunto, o Túplo e o Dicionário.
"""


def enum_from_to(start: int, end: int) -> list:
    """
    Constrói a lista dos números inteiros compreendidos entre dois limites.

    _Exemplos_

    >>> enum_from_to(1, 5)
    [1, 2, 3, 4, 5]
    >>> enum_from_to(1, 1)
    [1]
    """
    result = []

    i = start

    while i <= end:
        result.append(i)
        i = i + 1

    return result


def reverse(elems: list) -> list:
    """
    Calcula a lista inversa.

    _Exemplos_

    >>> reverse([10, 20, 30])
    [30, 20, 10]

    >>> reverse([5, 8, 3, 9])
    [9, 3, 8, 5]

    >>> reverse([])
    []
    """
    result = []

    i = len(elems) - 1

    while not i < 0:
        result.append(elems[i])
        i -= 1

    return result


def is_elem(elem, values: list) -> bool:
    """
    Verifica se um elemento existe numa lista.

    _Exemplos_

    >>> is_elem(20, [10, 20, 30])
    True
    >>> is_elem(2, [10, 20, 30])
    False
    """
    for value in values:
        if value == elem:
            return True

    return False


def maximum(values: list) -> int:
    """
    Retorna o valor máximo.

    _Exemplos_

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


def sums(values: list) -> list:
    """
    Calcula as somas acumuladas.

    _Exemplos_

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


if __name__ == '__main__':
    import doctest
    doctest.testmod()
