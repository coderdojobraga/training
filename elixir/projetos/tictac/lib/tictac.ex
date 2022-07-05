defmodule Tictac do

  @players {:x, :o}

  def check_player(player) do
    case player do
      :x -> {:ok, player}
      :o -> {:ok, player}
      _  -> {:error, :invalid_player}
    end
  end

  def place_piece(board, place, player) do
    case board[place] do
      nil -> {:error, :invalid_location}
      :x  -> {:error, :occupied}
      :o  -> {:error, :occupied}
      ok  -> {:ok, %{board | place => player}}
    end
  end

  def play_at(board, col, row, player) do
    with {:ok, valid_player}  <- check_player(player),
         {:ok, square}        <- Square.new(col, row),
         {:ok, new_board}     <- place_piece(board, square, valid_player),
    do: new_board
  end

  def new_board do
    for s <- squares(), into: %{}, do: {s, :empty}
  end

  def all_x do
    for s <- squares(), into: %{}, do: {s, :x}
  end

  def squares do
    for c <- 1..3, r <- 1..3, into: MapSet.new(), do: %Square{col: c, row: r}
  end

  def play(board, :x) do
    if not winner?(board, :o) do
      if not tie?(board) do
        IO.puts("X playing:")
        {row, _} = IO.gets("Row: ") |> Integer.parse
        {col, _} = IO.gets("Collumn: ") |> Integer.parse
        if row in 1..3 and col in 1..3 do
          {:ok, square} = Square.new(col, row)
          if board[square] == :empty do
            board = board |> play_at(col,row, :x)
            Print.tab
            Print.print_board(board)
            play(board, :o)
          else
            Print.tab
            IO.puts("Somebody already played here")
            Print.print_board(board)
            play(board, :x)
          end
        else
          Print.tab
          IO.puts("Wrong coordinates")
          Print.print_board(board)
          play(board, :x)
        end
      else
        IO.puts("Tied Game")
      end
    else
      IO.puts("O is the winner")
    end
  end

  def play(board, :o) do
    if not winner?(board, :x) do
      if not tie?(board) do
        IO.puts("O playing:")
        {row, _} = IO.gets("Row: ") |> Integer.parse
        {col, _} = IO.gets("Collumn: ") |> Integer.parse
        if row in 1..3 and col in 1..3 do
          {:ok, square} = Square.new(col, row)
          if board[square] == :empty do
            board = board |> play_at(col,row, :o)
            Print.tab
            Print.print_board(board)
            play(board, :x)
          else
            Print.tab
            IO.puts("Somebody already played here")
            Print.print_board(board)
            play(board, :o)
          end
        else
          Print.tab
          IO.puts("Wrong coordinates")
          Print.print_board(board)
          play(board, :o)
        end
      else
        IO.puts("Tied Game")
      end
    else
      IO.puts("X is the winner")
    end
  end


  def winner?(board, player) do
    (pos(board,player,1,1) and pos(board,player,1,2) and pos(board,player,1,3)) or
    (pos(board,player,2,1) and pos(board,player,2,2) and pos(board,player,2,3)) or
    (pos(board,player,3,1) and pos(board,player,3,2) and pos(board,player,3,3)) or
    (pos(board,player,1,1) and pos(board,player,2,1) and pos(board,player,3,1)) or
    (pos(board,player,1,2) and pos(board,player,2,2) and pos(board,player,3,2)) or
    (pos(board,player,1,3) and pos(board,player,2,3) and pos(board,player,3,3)) or
    (pos(board,player,1,1) and pos(board,player,2,2) and pos(board,player,3,3)) or
    (pos(board,player,1,3) and pos(board,player,2,2) and pos(board,player,3,1))
  end

  def pos(board, player, col, row) do
    {:ok, square} = Square.new(col, row)
    board[square] == player
  end

  def tie?(board) do
    board
    |> tie_aux()
    |> flat_and()
  end

  def tie_aux(board) do
    for row <- 1..3, col <- 1..3 do
      {:ok, square} = Square.new(col, row)
      board[square] != :empty
    end
  end

  def flat_and([bool]), do: bool
  def flat_and([h|t]) do
    h and flat_and(t)
  end

  def main do
    board = new_board()
    Print.print_board(board)
    play(board, :x)
  end
end
