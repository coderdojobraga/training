defmodule CollatzConjecture do

  require Integer

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  def calc(input) when input < 0, do: raise FunctionClauseError

  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) do
    cond do
      input == 0 -> raise FunctionClauseError
      input < 0  -> raise FunctionClauseError
      input == 1 -> 0
      true       -> input
                    |> list_of_steps()
                    |> Enum.count()
                    |> Kernel.length()
    end
  end

  defp list_of_steps(1), do: [1]
  defp list_of_steps(input) do
    if Integer.is_even(input) do
      next = input / 2
             |> Integer.parse()
      [next|list_of_steps(next)]
    else
      next = input * 3 + 1
             |> Integer.parse()
      [next|list_of_steps(next)]
    end
  end

end
