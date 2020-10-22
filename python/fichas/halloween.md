# Desafios de Halloween :jack_o_lantern:

1. A *CoderBruxa* sai todos os anos à rua na noite de 31 de outubro para assustar as crianças que por lá andam. Este ano, como as crianças não podem andar em grupo à procura de doçuras, ela precisa de dividir o trabalho com o seu ajudante *DojoStein*. 
A *CoderBruxa* tem uma lista enorme de nomes de crianças para assustar, e precisa da tua ajuda para dividir as crianças entre ela, e o seu ajudante. Decidiu que ela ficava encarregue de assustar as crianças que se encontram nas posições **pares** da lista. O *DojoStein* fica encarregue das restantes.
Será que os podes ajudar?

Apresenta uma definição da função `def importar_a_assustar(nome_do_ficheiro : str) ->
List[str]` que dado o nome do ficheiro que contém todas as crianças a assustar, adiciona cada criança a uma lista.

*Por exemplo:*

```python
>>> nome_ficheiro = "nomes.txt"
>>> importar_a_assustar(nome_ficheiro)
["Luca Brito", "Melissa Costa", "Artur Garcia"]
```

Apresenta uma definição da função `def assustar_coder_bruxa(criancas : List[str]) ->
List[str]` que, dada a lista com todas as crianças que tem de assustar, constrói a lista das crianças que a *CoderBruxa* ficará encarregue de assustar.

*Por exemplo:*

```python
>>> criancas = ["Luca Brito", "Melissa Costa", "Artur Garcia"]
>>> assustar_coder_bruxa(criancas)
["Melissa Costa"]
```

Apresenta uma definição da função `def assustar_dojen_stein(criancas : List[str]) ->
List[str]` que, dada a lista com todas as crianças que tem de assustar, constrói a lista das crianças que o *DojoStein* ficará encarregue de assustar.

*Por exemplo:*

```python
>>> criancas = ["Luca Brito", "Melissa Costa", "Artur Garcia"]
>>> assustar_dojo_stein(criancas)
["Luca Brito", "Artur Garcia"]
```
