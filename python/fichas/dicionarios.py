#!/usr/bin/env python
"""
# Ficha x: Questões sobre Dicionários

Assim como as listas, os Dicionários são usados para aramzenar dados em uma única variável.
Entretanto, a sua diferença se encontra principalmente nos índices e nos seus métodos:
Uma lista possui int's como índice, enquanto um dicionário possui quase qualquer tipo de dado.
Os dicionários possuem o que chamamos de chaves (keys) e valores (values) para fazer a associação.
"""

def traducoes(d:dict)-> list:
    """
    Imagine um dicionário em que há a tradução literal das palavras usadas como chave nos valores.
    Determine uma função que devolve a lista das palavras traduzidas em ordem alfabética.

    Exemplos:

    >>> my_dict = { "azul":"blue",
                    "amarelo":"yellow",
                    "vermelho":"red"}

    >>> traducoes(my_dict)
    ["blue", "red", "yellow"]
    """

    my_dict = { "azul":"blue",
                    "amarelo":"yellow",
                    "vermelho":"red"}

    traducao = list(my_dict.values()).sort()
    return traducao

def quadrados(n:int)->dict:
    """
    Defina uma função que construa um dicionário onde os valores são os quadrados das chaves.
    Se conta seria de 1 até o 'n'.

    _Exemplos_

    >>> quadrados(3)
    {1:1, 2:4, 3:9}
    """

    dic = dict()
    i = 1
    while i <= n:
        dic[i] = i ** 2
        i += 1
    return dic