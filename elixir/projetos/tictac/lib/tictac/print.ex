defmodule Print do

  def print_board(board) do
    print_line(1, board)
    IO.puts("-----")
    print_line(2, board)
    IO.puts("-----")
    print_line(3, board)
  end

  def print_line(row, board) do
    print_square(1, row, board) <> "|" <>
    print_square(2, row, board) <> "|" <>
    print_square(3, row, board) |>
    IO.puts()
  end

  def print_square(col, row, board) do
    with {:ok, square} <- Square.new(col, row),
    do: square_to_string(board[square])
  end

  def square_to_string(square) do
    case square do
      :x     -> "X"
      :o     -> "O"
      :empty -> "."
    end
  end

  def tab do
    for x <- 1..9, do: IO.puts("")
  end

end
