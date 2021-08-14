#!/usr/bin/env python
"""
# Ficha x: Programação Funcional em Python

## Recursividade

A programação funcional resolve problemas pela composição de funções.
Idealmente, as funções apenas recebem entradas e produzem saídas, e não têm
nenhum estado interno que afete a saída produzida para uma determinada entrada.
As linguagens funcionais mais conhecidas incluem linguagens, tais como,
Haskell, OCaml, F# e Elixir.
"""


def fact(n: int) -> int:
    r""" #Found this 'r', is it necessary?
    Calcula o produto de todos os número naturais menores ou iguais a `n`. Em
    matemática costuma-se representar por $n!$. Este operador chama-se
    factorial e define-se assim:

    $$n! = n \times (n - 1)!$$

    _Exemplos_

    >>> fact(5)
    120
    >>> 5 * fact(4)
    120
    >>> fact(1)
    1
    """
    if n == 1:
        return 1

    return n * fact(n - 1)


def fib(n: int) -> int:
    """
    Calcula o o n-ésimo elemento da sequência de Fibonacci.

    A sequência de Fibonacci é uma sequência de números inteiros, começando
    normalmente por 0 e 1, na qual cada termo subsequente corresponde à soma
    dos dois anteriores.

    ---

    ![Ilustração representativa da série de Fibonacci, demonstrando o
    crescimento populacional de coelhos (carregando ovos de
    páscoa)](https://upload.wikimedia.org/wikipedia/commons/7/7a/FibonacciRabbit.svg){width=200}

    Esta sequência foi utilizada pelo matemático italiano Leonardo de Pisa,
    mais conhecido por Fibonacci, para descrever o crescimento de uma população
    de coelhos a partir desta.

    ---

    _Exemplos_

    >>> fib(0)
    1
    >>> fib(1)
    1
    >>> fib(4)
    5
    >>> fib(5) + fib(6)
    21
    >>> fib(7)
    21
    """
    if n in (0, 1):
        return 1

    return fib(n - 1) + fib(n - 2)


if __name__ == '__main__':
    import doctest
    doctest.testmod()
