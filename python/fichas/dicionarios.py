#!/usr/bin/env python
"""
# Ficha x: Questões sobre Dicionários

Assim como as listas, os Dicionários são usados para armazenar dados em uma única variável.
No entanto, a sua diferença encontra-se principalmente nos índices e nos seus métodos:
Uma lista possui int's como índice, enquanto que um dicionário possui quase qualquer tipo de dados.
Os dicionários possuem o que chamamos de chaves (keys) e valores (values) para fazer a associação.
"""


def traducoes(d: dict) -> list:
    """
    Dado um Dicionário
    com Strings como Chaves e seus respetivos Valores sendo as traduções de cada, devolve
    uma lista em ordem alfabética com as traduções.

    _Exemplos_

    >>> colors = {"azul":"blue", "amarelo":"yellow", "vermelho":"red"}

    >>> traducoes(colors)
    ['blue', 'red', 'yellow']

    >>> numbers ={"one":"uno", "two":"dos", "three":"tres"}

    >>> traducoes(numbers)
    ['dos', 'tres', 'uno']
    """

    traducao = list(d.values())
    traducao.sort()
    return traducao


def quadrados(n: int) -> dict:
    """
    Constrói um dicionário onde os valores são os quadrados das chaves.
    Se conta seria de 1 até o 'n'.

    _Exemplos_

    >>> quadrados(3)
    {1: 1, 2: 4, 3: 9}

    >>> quadrados(0)
    {}
    """

    dic = dict()
    i = 1
    while i <= n:
        dic[i] = i**2
        i += 1
    return dic


if __name__ == '__main__':
    import doctest
    doctest.testmod()