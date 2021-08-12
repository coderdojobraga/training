# Ficha x: Programação Funcional em Python

## Recursividade

1. Apresente uma definição da função `def fact(n: int) -> int` que calcula o
   produto de todos os número naturais menores ou iguais `n`. Em matemática
   costuma-se representar por $n!$, a este operador chama-se factorial. E
   define-se assim:

   $$n! = n \times (n - 1)!$$

_Por exemplo:_

```python
>>> fact(5)
120
>>> 5 * fact(4)
120
>>> fact(1)
1
```

2. Apresente uma definição da função `def fib(n: int) -> int` que calcula o o
   n-ésimo elemento da sequência de Fibonacci.

A sequência de Fibonacci é uma sequência de números inteiros, começando
normalmente por 0 e 1, na qual cada termo subsequente corresponde à soma dos
dois anteriores. Esta sequência foi utilizada pelo matemático italiano Leonardo
de Pisa, mais conhecido por Fibonacci, para descrever o crescimento de uma
população de coelhos a partir desta.

![Ilustração representativa da série de Fibonacci, demonstrando o crescimento populacional de coelhos (carregando ovos de páscoa)](https://upload.wikimedia.org/wikipedia/commons/7/7a/FibonacciRabbit.svg){width=200}

_Por exemplo:_

```python
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
```
