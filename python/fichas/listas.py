#!/usr/bin/env python
"""
Questões sobre Listas
=====================

As listas são usadas para armazenar vários elementos numa única variável.
Fazendo parte de uma das 4 estruturas de dados built-in na linguagem Python
utilizadas para guardar coleções de dados. As restantes estruturas são o
Conjunto (Set), o Túplo e o Dicionário.
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


def reverse(a: list[int]) -> list[int]:
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


# 3. Apresente uma definição da função `def elem(a: Any, b: List[Any]) -> bool`
# que testa se um elemento existe numa lista.

# *Por exemplo:*

# ```python
# >>> elem(20, [10, 20, 30])
# True
# >>> elem(2, [10, 20, 30])
# False
# ```

# 4. Apresente uma definição da função `def maximo(a: List[int]) -> int`
# que, dada uma lista de inteiros, devolve o maior elemento dessa lista.

# *Por exemplo:*

# ```python
# >>> maximo([10, 20, 30])
# 30
# >>> maximo([0])
# 0
# >>> maximo([20, 78, 32, 40])
# 78
# ```

# 5. Apresente uma definição da função `def somas_acumuladas(a: List[int]) -> List[int]`
# que, dada uma lista de inteiros, devolve uma nova lista que contém as somas acumuladas da lista original.

# *Por exemplo:*

# ```python
# >>> somas_acumuladas([10, 20, 30])
# [10, 30, 60]
# >>> somas_acumuladas([3, 3, 3])
# [3, 6, 9]
# >>> somas_acumuladas([1, 2, 3, 4])
# [1, 3, 6, 10]
# >>> somas_acumuladas([5, 2, 1, 7])
# [5, 7, 8, 15]
# ```
