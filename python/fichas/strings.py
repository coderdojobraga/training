#!/usr/bin/env python
"""
# Ficha x: Questões sobre Strings

Strings em Python colocam-se entre aspas simples ou aspas duplas. `'hello'` é o
mesmo que `"hello"`.

Tal como em muitas outras linguagens de programação, as strings em Python são arrays de bytes que representam caracteres Unicode.

No entanto, em Python não existe o tipo caractere, um único caractere é simplesmente uma string com o comprimento 1.
"""


def rm_vowels(word: str) -> str:
    """
    Remove todas as vogais de uma string. Os restantes carácteres não
    são alterados.

    _Exemplos_

    >>> rm_vowels('aeiou')
    ''
    >>> rm_vowels('CoderDojo Braga')
    'CdrDj Brg'
    >>> rm_vowels('Hello, World!')
    'Hll, Wrld!'
    """
    result = ''

    for char in word:
        if char not in "aeiou":
            result += char

    return result


def most_freq_char(word: str) -> str:
    """
    Determina qual o carácter mais frequente numa string. Para strings vazias é
    retornada string vazia.

    _Exemplos_

    >>> most_freq_char('Hello World')
    'l'
    >>> most_freq_char('')
    ''
    >>> most_freq_char('Coder Dojo')
    'o'
    """
    if len(word) <= 0:
        return ''

    freq: dict[str, int] = {}

    for char in word:
        if char in freq:
            freq[char] += 1
        else:
            freq[char] = 1

    key, _count = max(freq.items(), key=lambda x: x[1])

    return key


if __name__ == '__main__':
    import doctest
    doctest.testmod()
