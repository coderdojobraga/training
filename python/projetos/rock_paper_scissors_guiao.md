# Pedra,Papel e Tesoura

## Introdução

### *Projeto*

Este Guião buscar ajudar o Ninja a criar uma versão textual do famoso jogo **Pedra, Papel e Tesoura**.

Antes de começar, espera-se que o ninja possua conhecimento sobre:  *I/O, Listas, Aleatoridade, Condicionais e Loops*.

### *Requisitos*

O Guião foi dividido em 5 módulos para tentar facilitar o desenvolvimento do projeto:

+ Comparador de Jogadas 
+ Jogo
+ Bonus 1 (opcional)
+ Bonus 2 (opcional)
+ Interface

> Este projeto foi pensado visando o uso de `Python` mas pode ser feito com qualquer outra linguagem textual de escolha.

> Caso opte por `Python`, considere usar a biblioteca `random` para lhe ajudar
>```python
> import random
>```
>Escreva isto no início do script para poder usá-la

## Comparador de Jogadas

### *Descrição*

Antes de pensarmos no funcionamento do jogo, precisamos definir uma função que seja capaz de comparar 2 jogadas (feitas pelos jogadores) e determinar o vencedor da rodada.

Nesta função espera-se que dado qualquer combinação de jogadas possíveis obtenha-se o resultado certo. Se precisar, consulte a tabela abaixo com os resultados possìveis:

| **J1/J2** | *Pedra*  | *Papel*  | *Tesoura* |
| :----     | :----:   | :----:   | :----:    |
| *Pedra*   | Empate   | J2 Vence | J1 Vence  |
| *Papel*   | J1 Vence | Empate   | J2 Vence  |
| *Tesoura* | J2 Vence | J1 Vence | Empate    | 

## Jogo

### *Descrição*

A função Jogo será a versão mais básica do projeto. Se trata de uma partida infinta entre o Ninja e a Máquina com pontuação sendo opcional. 

Ela precisará de:

+ Pedir a jogada do Ninja
+ Escolher uma jogada aleatória da Máquina
+ Mostrar o que cada um jogou na tela
+ Comparar e dizer quem foi o vencedor (use a função do módulo anterior)
+ Caso opte por pontuação, mostrar o placar atualizado
+ Recomeçar o a partida

> Por se tratar de uma partida infinita, uma boa idéia seria criar uma opção de sair da partida quando não quiser jogar mais 

## Bonus #1

### *Descrição*

Nesta versão, o jogo se torna impossível de vencer a Máquina. Independente da escolha do Ninja, a Máquina sempre escolherá a jogada vencedora.

Temos então que:

+ Pedir a jogada do Ninja
+ Garantir que a Máquina escolha a jogada que vence
+ Repetir os 4 últimos passos do módulo anterior

> Por diversão, quando estiver pronto esse módulo, o Ninja pode desafiar outras pessoas a vencerem a Máquina até elas perceberem que é impossível

## Bonus #2

### *Descrição*

Para esta versão, o jogo se tornará um *Best of N*, onde *N* seria o número máximo de partidas possíveis. Logo, para esta é necessário possuir pontuação para podermos saber quanto falta para o jogo acabar.

Com isso, temos que:

+ Determinar quantos pontos serão necessários para vencer
+ Pedir a jogada do Ninja
+ Escolher uma jogada aleatória da Máquina
+ Mostrar o que cada um jogou na tela
+ Comparar e dizer quem foi o vencedor (use a função do módulo *Comparador de Jogadas*)
+ Mostrar o placar atualizado
+ Quando alguém chegar a pontuação obejtivo mostrar na tela quem foi e encerrar o jogo

> Para calcular a relação da pontuação objetivo e do máximo de partidas use a fórmula: $N = 2 \times P-1$. Onde $N$ e $P$ seriam o máximo de partidas e a pontuação objetivo respectivamente. 

## Interface

### *Descrição*

A Interface ficará responsável de mostrar as opções disponíveis e selecionar qual caminho deve-se seguir a partir da escolha feita.

O que deve conter nela:

+ A mensagem de abertura do Jogo
+ Caso o Ninja tenha feito os 3 módulos, uma opção de escolha de qual jogar
+ Uma mensgaem de despedida quando acabar o Jogo (opcional)

> É possível escrever o código deste módulo em um mesmo ficheiro com os anteriores e não há mal nenhum! Contudo é uma boa oportunidade de aprender a trabalhar com ficheiros diferentes! 

## Conclusão

Por fim, com o projeto concluído só é preciso testá-lo de formas diferentes e corrigir eventuais erros que podem vir a surgir com os testes.

Após isto, o Ninja pode guardar o projeto em algum repositório para poder atuallizar ou reutilizar no futuro.

Não esqueça também de mostrar o bom trabalho que fez com uma apresentação do projeto e facilitar o progresso para o próximo cinturão. 