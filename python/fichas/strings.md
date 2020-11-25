# Questões sobre Strings

1. Apresente uma definição da função `def strlen(string: str) -> 
int` que calcula o comprimento de uma string.

*Por exemplo:*

```python
>>> strlen("Hello World")
11
>>> strlen("")
0
>>> strlen("CoderDojo")
9
```

2. Apresente uma definição da função `def str_concatena(str1: str,
str2: str) -> str` que concatena a string s2 a s1.

*Por exemplo:*

```python
>>> str_concatena("Hello", "World")
"Hello World"
>>> str_concatena("Hello", "")
"Hello"
>>> str_concatena("Coder", " Dojo")
"Coder Dojo"
```

3. Apresente uma definição da função `def str_inverte(string: str)
-> str` que inverte uma string.

*Por exemplo:*

```python
>>> str_inverte("Hello World")
"dlroW olleH"
>>> str_inverte("")
""
>>> str_inverte("arara")
"arara"
```

4. Apresente uma definição da função `def str_sem_vogais(string: str)
-> str` que retira todas as vogais de uma string.

*Por exemplo:*

```python
>>> str_sem_vogais("Hello World")
"Hll Wrld"
>>> str_sem_vogais("")
""
>>> str_sem_vogais("Coder Dojo")
"Cdr Dj"
```

5. Apresente uma definição da função `def char_mais_freq(string: str)
-> str` que determina qual o carater mais frequente numa string. Caso a string seja vazia, deve ser retornada a string vazia.

*Por exemplo:*

```python
>>> char_mais_freq("Hello World")
"l"
>>> char_mais_freq("")
""
>>> char_mais_freq("Coder Dojo")
"o"
```