# [Wordle](https://www.nytimes.com/games/wordle/index.html)
## 1. Introdução
Este projeto consiste na implementação de um conjunto de tarefas, abaixo introduzidas, de forma a recriarmos o jogo **[wordle](https://www.nytimes.com/games/wordle/index.html)** do The New York Times.

Versão PT-PT: [palavra do dia](https://palavra-do-dia.pt)

#### Como jogar:
**Objetivo:** Adivinhar a palavra em 6 tentativas.


- Cada tentativa deve ser uma palavra válida com 5 letras.
- Depois de cada tentativa submetida, os blocos mudam de cor para mostrar o quão perto estás de adivinhar a palavra.
 
 
 Exemplo:
 - O W pertence à palavra e está na posição correta
 - O I pertence à palavra mas está na posição errada
 - O U não pertence à palavra 


Exemplo de jogada real:

<img src="https://user-images.githubusercontent.com/77453924/166671040-9beb5cd5-f860-45ad-82fe-dc9d90a27fd0.png" alt="drawing" width="150"/>  

###### fig.1

 - **1ª linha** - L pertence à palavra mas está na posição errada
 - **2ª linha** - L continua na posição errada
 - **3ª linha** - B e A pertencem à palavra e estão na posição correta
 - **4ª linha** - Juntando as pistas anteriores descobrimos a palavra em 4 tentativas
 
 
#

## 2. Tarefas

### 2.1 - Tarefa 1

  O objetivo desta tarefa é criares uma função que recolhe palavras de 5 caracteres e as guarda assim que o utilizador pressionar Enter.  
  (Define uma solução inicial para o teu wordle.)  
  Esta função só para de ler palavras se o número de tentativas (6) for excedido ou se a palavra inserida for a mesma que a definida por ti inicialmente.  
  
### 2.2 - Tarefa 2
  Nesta tarefa o teu programa deve ser capaz de identificar que letras pertencem à solução e a sua posição.
  Por exemplo:	<img src="https://user-images.githubusercontent.com/77453924/166673281-96c85f5f-658d-487a-a8f8-0175aca9fc3d.png" alt="drawing" width="100"/>  irá retribuir [verde, cinza, verde, cinza, amarelo].

**Nota:** Toma particular atenção às palavras que repetem letras. 

### 2.3 - Tarefa 3
Nesta tarefa o teu programa deverá ter uma representação gráfica completa idêntica à da fig.1 .

### 2.4 - Tarefa bónus
**- Bónus 1**

  Podes também adicionar uma representação visual das letras do teclado ainda disponíveis para formar a palavra-chave.  
  Por exemplo, da jogada da fig.1 resulta o teclado:  

<p align="center">
  <img width="300" alt="Screenshot 2022-04-10 at 16 57 12" src="https://user-images.githubusercontent.com/77453924/166673777-253609c4-4627-45f3-8935-14a5721b6732.png">
</p>
  
  
**- Bónus 2**  
  Criar um banco de palavras para que o jogo apenas aceite palavras do dicionário.  
**- Bónus 3**  
	Criar e guardar estatísticas. 


