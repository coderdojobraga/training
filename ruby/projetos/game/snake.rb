require 'ruby2d'

set background: 'red' # cor do fundo da janela. "set" vem de "setting" que é "configuração". Nesse caso estamos "configurando" o background da janela
set fps_cap: 20 # nesse caso estamos configurando o tempo de duração de cada frame(tempo que drua cada imagem no ecrâ) para ele ser mais lento, senão seria rápido demais para ver o jogo acontecer. Estamos indicando que cada frame vai durar 1/20 segundo em nosso jogo. Ou seja: 20 frames por segundo (fps) - regra de 3. O que damos é a quantidade de frames em 1 segundo

# width = 640  -> largura da janela em que o jogo será exibido por padrão
# height = 480  -> altura da janela em que o jogo será exibido por padrão

# para ver a largura posso fazer por exemplo print(Window.width)

GRID_SIZE = 20  # toda vez que formos desenhar algo, ou calcular distâncias, por padrão de unidade terá 20 pixels(padrão abstrato, nesse caso vamos considerar 20 vezes o padrão que é o pixel). Logo teremos 640/20 = 32 pixels lado a lado e 480/20 = 24 pixels encima um do outro
                # isso é importante para criarmos um referencial abstrato, logo mais erá entendido
GRID_WIDTH = Window.width / GRID_SIZE # largura da janela é 640 pixels, dividido pelo GRID_SIZE da o número de quadrados (unidade abstrata) que tem lateralmente no jogo: 32 
GRID_HEIGHT = Window.height / GRID_SIZE # mesmo raciocínio que encima só que para altura
# Window.blabla é uma regalia do ruby2d para devolvar o tamanho que eu queira da janela(que nesse caso sei que por default é 640 e 480)

class Snake  # criação da class Snake(por norma uma classe começa com letra maiúscula)
    
        attr_writer :direction # permite no futuro mudarmos o "conteúdo" da direction(já no código principal, pois dentro da classe posso modificar suave fazendo os .push) igualando ele a algo, caso contrário não poderiamos mudar. "attr_writer" significa "podemos ler e modificar" o que conteúdo que vem depois
                               # o local que os ":" está escrito tem de ser mesmo colado a direction, senão da erro ahuahuhau
    def initialize 
    # toda classe tem que ter uma espécie de "função"(método) aliada a ela no momento de sua declaração. Função a qual será encarregue de iniciar os "conteúdos" contidos por padrão na classe. Declaramos "funções/métodos" usando o def e como sempre o end. É aqui que declaramos os "conteúdos" ao mesmo tempo que os preenchemos
    # nesse caso nossa classe snake terá os "conteúdos": positions, direction (indicamos que é o "conteúdo" de uma classe colocando o arroba@ na frente) e growing
    # positions: array de coordenadas que nossa cobra vai ocupar no ecrã
    # direção do movimento da cobra
    # growing é um booleano que vai nos ajudar a saber quando devemos aumentar a cobra ou não mediante as frutas comidas. Por default a cobra ainda não comeu nada, por isso será false
       @positions = [[2,0],[2,1],[2,2],[2,3]]  # ordem: calda - corpo - corpo- cabeça (início do array: calda, final: cabeça)
       @direction = 'down'
       @growing = false
    end

    def draw
    # para além do método de inicialização, a classe snake pode ter mais métodos que manuseam seus conteúdos das mais diversas formas
    # nesse caso o método draw desenhará a cobra, onde vamos usufruir do método Square que desenhará as unidades do projeto que definimos sendo 20 pixels.
        @positions.each do |position| # semelhante ao método "each_with_index" aplicado a arrays, mas nesse caso é mais simples, apenas teremos acesso aos valores do array em cada iteração(nomeadamente através da variável "position") e não aos seus ínidices.
            Square.new(x: position[0]*GRID_SIZE, y: position[1]*GRID_SIZE, size: GRID_SIZE - 1, color: 'white') # o método Square desenha quadrado na tela. É uma das coisas já feitas proporcionadas pelo ruby2d
            # ele recebe 4 argumentos: (coordenada em x(unidade é pixel do referencial) do local em que o desenho será feito, (supor que a parte de cima da janela é o eixo 0 do y e o lado esquerdo da tela é o eixo 0 do x e eles crescem para direita e para baixo - sistemad e referncial padrão do ruby2d)
            #                           coordenada em y do local em que o desenho será feito, ( a junção das coordenadas x e y darão o vértice superior esquerdo que o quadrado será feito)
            #                           tamanho do quadrado em pixels , ou seja, damos o LADO em pixels que o quadrado terá(a quantidade de pixels será size x size). Colocamos -1 para poder ver a separação fininha de cada parte do quadrado unidade, pois senão ia ficar tudo perfeitinho de acordo com o gridsize dos locais de desenho dos quadrados e não daria para ver a separação dos quadrados
            #                           cor do quadrado)             
        end
    end

    def move # o movimento acontece ao removermos o primeiro item do array (calda) e adicionarmos um novo elemento no final (cabeça) com suas novas coordenadas de localização
        if !@growing # quando a cobra não estiver crescendo, isto é, quando não tiver comida fruta, ai sim tiraremos a calda e damos a ilusão padrão de movimento. Caso ela estiver growing, esta linha não será executada
            @positions.shift # shift remove o primeiro item do array e reorganiza uma posição para esquerda os demais. Assim o array passará a ser menor.
        end
        
        case @direction   # avalia o que fazer para cada possível valor que o conteúdo da direction terá (uma espécie de "If" organizado)
        # atenção que a chamada do método new_coords vem num racicínio que só chegamos mais a frente
        when 'down' # when não precisa de end hauhuha é o único maybe. O código de cada caso é gerado até ser declarado outro "when"
            @positions.push(new_coords(head[0],head[1]+1)) # acrescentamos em y + 1 para simbolizar o movimento de ir para baixo. 
            # usamos então o método "push" para acrescentar um elemento no final do array, elemento que será exatamente igual o que era o "último" até então(a partir do método head que agora descobrimos que pode ser utilizado sem mais nada aliado, desde que seja usado dentro da própria classe, pois fora dela, no código em si não faria sentido usar sem um objeto referenciado), diferindo apenas no incremento da posição y, pois sabemos que nesse referencial a ordenada cresce para baixo.
        when 'up'
            @positions.push(new_coords(head[0],head[1]-1))    
        when 'right'
            @positions.push(new_coords(head[0] + 1,head[1]))
        when 'left'
            @positions.push(new_coords(head[0] - 1,head[1]))
        end

        @growing = false
    end

    # método que avalia se o movimento é válido, ou seja, a cobra não muda de direção para ela mesmo. Recebe um parâmetro que é dado no código em si quando um usuário faz um evento(é dada a direção a partir do clique do usuário)
    # usa-se "?" quando a função retorna um booleano
    def can_change_direction_to?(new_direction)
        case @direction 
        when 'up' # a sintax do when necessita que o seguinte bloco de código esteja noutra linha ou na mesma se for seguida de um "then"
             new_direction != 'down'  # caso a direção clicada for diferente de 'down' quando a minha direção atual for 'up', significa que posso mudar para tal direção, logo a desigualdade retorna true . Por tanto essa linha embaixo de cada case é o valor de retorno da função para além do que elas mesmos já fazem 
        when 'down'
             new_direction != 'up'
        when 'left'
             new_direction != 'right'
        when 'right' 
             new_direction != 'left'
        end
    end

    # devolve a coordenada em x da cabeça da cobra(usa o método head que ainda não foi criado, mas isso pode se fazer aqui(só na classe ou na linguagem toda?))
    def x
        head[0]
    end

    # devolve a coordenad em y da cabeça da cobra
    def y
        head[1] 
    end

    # avisa que ao fazermos o movimento da cobra, estaremos a condiderar o momento em que ela está crescendo também
    def grow
        @growing = true
    end

    # verifica se a cobra bateu nela mesma. Caso sim retorna 1(true)
    # para isso usaremos um trick com métodos do array de Ruby
    def hit_itself?
        @positions.uniq.length != @positions.length
        # o método uniq vai até um array e caso tenha elementos iguais, mantém apenas uma dessas ocorrências no array. Ou seja, caso alguma coordenada da posição do corpo da cobra for igual a outra posição de seu corpo, esse método vai diminuir o array. Mas nesse caso diminuiu só até fazermos a operação do length depois, a modificação não fica para frente(verificar se isto é porque temos outro método depois do uniq e isso é mais importante, caso não tivesse diminuia mesmo?)
        # logo depois comparamos o tamanho desse array sem elementos iguais junto com o array normal, caso o tamanho for igual, não temos a cobra tocando nela mesmo e a desigualdade dará false. Caso for diferente os tamanhos, quer dizer que existem posições iguais do mesmo corpo da cobra, logo a desigualdade da true, ou seja: ela hit nela mesma? Sim
    end
    # faz a cobra aparecer do outro lado do ecrã quando atravessa uma parede
    def new_coords(x,y) # retorna a linha que vem a seguir. Posso inovar esse método a toa /sozinho dentro da própria classe
        [x % GRID_WIDTH, y % GRID_HEIGHT] # retorna sempre o valor de x e y a não ser que x e y sejam iguais a GRID_WIDHT e GRID_HEIGHT respetivamente(que é quando a cobra bate na parede). Ai retorna 0 na coordenada correspondente. Pois quando estamos no vértice 32, o quadrado não é desenhado dentro: Ex  32 __________
        # a lógica disto está porque, o resto de uma divisão inteira é o resto quando:                                                                                                                                                                                                                              | desenho e aqui já é fora                                                                                                                                                                                                  |
        # d*Q + R = D , onde por exemplo:                                                                                                                                                                                                                                                                           | desenhos
        #   14/32  -> o quociente(Q) da divisão inteira dá sempre zero quando o D(14) é menor que d(32).
        #          -> assim teremos: 32*0 + R = 14  -> R = 14. 
        # this is matematic, funciona quando a posição vai para barreira de cima ou esquerda também, pois quando é -1(no vértice zero é o último momento de desenho depois não aparece no ecrâ), da retorno do 31(sei lá porque mais da) que é o vértice superior esquerdo do quadrado que queremos desenhar, se fosse 32 o desenho estaria fora da janela. Do mesmo jeito que quando estamos no 32, o desenho já não ficará na tela e por isso vamos para casa zro, que será o vértice suprior esquerdo do quadrado surgindo lá encima ou na esquerda
        # fazer testes de conta com o comando irb e fazer desenho photoshop  
    end

    # método criado para melhor clarificação(bons hábitos) - retorna o último item do array, a cabeça
    # por padrão, o ruby da "return" da última linha de código feita na definição do método, importante referir isso! pois só assim faz sentido a ideia de return aqui
    def head
        @positions.last
    end
end

class Game 
    def initialize
        @score = 0
        @ball_x = rand(GRID_WIDTH) # ball_x é um número inteiro aleatório de 0 a 31(coordenada em x das frutas). O rand gera números entre 0 e (o número do argumento - 1).
        @ball_y = rand(GRID_HEIGHT) # número aleatório de 0 a 23. rand é uma das regalias do ruby2d
        @finished = false # indicará se o jogo acabou ou não
    end
    
    def draw # desenha as frutas e o placar

       unless finished? # vamos fazer novas frutas apenas enquanto o jogo não ter acabado. Isso é tipo o unless que está no código que para o move quando o jogo acaba, nesse caso esse tem de estar aqui pois queremos manter o texto escrito do placar nos updates mesm se o jogo acaba
         Square.new(x: @ball_x * GRID_SIZE,y: @ball_y * GRID_SIZE, size: GRID_SIZE, color: 'yellow') # o método Square desenha quadrado na tela. É uma das coisas já feitas proporcionadas pelo ruby2d
       end
       
       Text.new(text_message,color: "black", x: 10, y: 10, size: 25)
       # do mesmo jeito que o ruby2d possibilita a utilização do método Square para desenhar quadrados na tela,
       # temos o método Text que faz o mesmo, só que com textos que damos no primeiro argumento(de resto os argumentos são iguais)
       # o que vem a seguir era antes de ter a chamada de um método ali no primeiro argumento do conteúdo do texto... será diferente ele mediante a partida ou o fimd dela
       # como queremos dar um valor que pode mudar no texto - uma variável ou nesse caso melhor um "conteúdo da classe"(o conteúdo do "score", devemos meter entre {} como no javascript)
       # acrescentamos o "@" por estarmos a lidar com um conteúdo dento de uma classe(se fosse no código fora classe, bastava ser game.score basicamente para obter o dado score ou modificá-lo))
    end

    def snake_hit_ball?(x,y) # ruby é linguagem moderna, não precisamos especificar qual o tipo do argumento, só escrever uma letra qualquer para identificá-lo
        @ball_x == x && @ball_y == y # caso a cabeça da cobra tiver as mesmas coordenadas que a posição de uma fruta, esta linha será verdadeira e como a função retorna um booleano pelo "?", e como essa linha é a ultima do código, o valor booleano desta conjunção será o valor de retorno da função
        # retorna 1 se a cobra comeu fruta(cabeça está na mesma posição de uma fruta)
    end

    def record_hit
        @score += 1
        # entraremos aqui quando a cobra comeu uma fruta, logo devemos fazer outra
        @ball_x = rand(GRID_WIDTH)
        @ball_y = rand(GRID_HEIGHT)
    end

    # ativa o valor true indicando que o jogo acabou
    def finish
        @finished = true
    end

    # retorna o valor booleano que indica se o jogo acabou ou não
    def finished?
        @finished
    end

    # retorna uma string
    def text_message
        if finished?
           "Game over, your score was: #{@score}, Press R to restar" 
        else
           "Score: #{@score}"
        end
    end

end

snake = Snake.new # cria um objeto que possui a classe Snake. Ou seja, posso utilizar os métodos pertencentes da classe Snake para o objeto snake.
# snake.draw
game = Game.new

# mais uma das regalias proporcionadas pelo ruby2d. O bloco de código que estará dentro do update será repetido a cada frame," como se fosse um each para o bloco eterno"
# https://www.mauthecomm.com/post/um-segundo-de-anima%C3%A7%C3%A3o-tem-quantos-frames -> explicação de frame
# ou seja, se o seu PC tiver 24 frames por segundo, então o bloco de código vai ser repetido a cada 1/24 segundos (regra de 3 simples que resulta na duração de cada frame). No nosso caso configuramos o frame para durar 1/20 segundos
update do
    clear # se não metemos isso, não será apagado o que foi feito no "updates" anteriores

    unless game.finished? # unless é o oposto do if. Ou seja: "se o jogo ainfa não ter acabado"... Isto é, se não for true o que está na condição, ele vai movimentar a cobra
        snake.move
    end
    snake.draw
    game.draw

    # verificação se a cobra comeu alguma fruta
    # caso sim devemos aumentar o placar, trocar de fruta(fazemos no record_hit mesmo) e aumentar a cobra
    if game.snake_hit_ball?(snake.x, snake.y)
        game.record_hit
        snake.grow # o raciocínio do aumento da cobra parte do pressuposto de não retirarmos a calda dela no processo da ilusão de movimento. Quando comemos fruta apenas adicionamos a coordenada da cabeça como no movimento normal, mas sem retirar a calda
    end

    # verifica se a cobra bateu nela mesma
    if  snake.hit_itself?
        game.finish
    end    
end

# fazer isso da erro por exemplo porque o array positions não está referenciado no attr_writer como algo que posso modificar fora da classe
# snake.positions[0] = [0,1]

# forma de interagir com os cliques do usuário. É executao o bloco de código sempre que haja uma interação do usuário através de um clique
# mais uma regalia do ruby2d
# atenção no local dos ":"
on :key_down do |event| # questão de notação. "event" carregará a informação do "clique" do usuário. Em breve vamos ver como aplicamos um método a este objeto(event) para retirarmos a tecla que foi clicada
    # event.key  # o método .key retorna a string dizendo a tecla que foi clicada. Se eu clicar a setinha debaixo a string será "down"(há que ter conhecimento prévio do nome de cada tecla)
    # poderíamos usar a técnica do "case" e fazer para cada situação de event.key ser igual a 'down', 'up', etc.
    # mas vamos usar outra forma de escrita
    if ['up','down','right','left'].include?(event.key) # usamos aqui uma condição de que: "Se o event.key(que é a tecla clicada pelo usuário) for uma das(está INCLUÍDA na lista) que estão na lista" então faça... Temos nada mais nada menos do que uma condição escrita de forma nova
        if snake.can_change_direction_to?(event.key) # can_change_direction_to recebe ponto de interrogação no final pois é um método que devolve um valor lógico - booleano. Aqui estamos a verificar se a cobra não vai mudar para direção oposta a que ela está indo, fazendo um movimento estranho. Por exemplo se ela está indo para direia e o usuário clica esquerda, isto não pode acontecer.
            snake.direction = event.key # podemos acessar o conteúdo da snake(conteúdos que são os mesmos da classe Snake, pois declaramos snake sendo um objeto que tem a classe Snake) da mesma forma que acessamos um método, colocando .conteúdo. Nesse caso estamos fazendo mais que acessar... estamos a mudar! consoante o clique
        end
    elsif event.key == 'r'  # elsif KKKKKKKKKKKKKKKKKKKK
        snake = Snake.new
        game = Game.new
    end
end

show # para abrir janela, sem ela não veríamos o jogo(deve ser colocada no final do código)

# fazer o ruben dar uma parada após fazer o "event. key" para entender o processo que ocorre com a junção do "update" quando clicas em algo e muda a direção
