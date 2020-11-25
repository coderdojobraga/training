# Questões sobre Listas

1. Apresente uma definição da função `def enum_from_to(a: int, b: int) ->
List[int]` que constrói a lista dos números inteiros compreendidos entre dois
limites.

*Por exemplo:*

```python
>>> enum_from_to(1, 5)
[1,2,3,4,5]
```

2. Apresente uma definição da função `def reverse(a: List[Any]) -> List[Any]`
que dada uma lista calcula uma lista com os elementos dessa lista pela ordem
inversa.

*Por exemplo:*

```python
>>> reverse([10, 20, 30])
[30,20,10]
```

3. Apresente uma definição da função `def elem(a: Any, b: List[Any]) -> bool`
que testa se um elemento existe numa lista.

*Por exemplo:*

```python
>>> elem(20, [10, 20, 30])
True
>>> elem(2, [10, 20, 30])
False
```

4. Apresente uma definição da função `def maximo(a: List[int]) -> int`
que, dada uma lista de inteiros, devolve o maior elemento dessa lista.

*Por exemplo:*

```python
>>> maximo([10, 20, 30])
30
>>> maximo([0])
0
>>> maximo([20, 78, 32, 40])
78
```

5. Apresente uma definição da função `def somas_acumuladas(a: List[int]) -> List[int]`
que, dada uma lista de inteiros, devolve uma nova lista que contém as somas acumuladas da lista original.

*Por exemplo:*

```python
>>> somas_acumuladas([10, 20, 30])
[10, 30, 60]
>>> somas_acumuladas([3, 3, 3])
[3, 6, 9]
>>> somas_acumuladas([1, 2, 3, 4])
[1, 3, 6, 10]
>>> somas_acumuladas([5, 2, 1, 7])
[5, 7, 8, 15]
```
