defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """


  def decimal_to_binary(decimal) do
    Integer.digits(decimal,2)
    |> Enum.join("")
    |> String.to_integer()
  end

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    if code >= 16 do
      code - 16
      |> aux_commands()
    else
      code
      |> aux_commands()
      |> Enum.reverse()
    end
  end

  def aux_commands(code) do
    binary = decimal_to_binary(code)
    cond do
      binary > 10000    -> aux_commands(code-16)
      binary == 10000   -> []
      binary >= 1000    -> ["jump"|aux_commands(code-8)]
      binary >= 100     -> ["close your eyes"|aux_commands(code-4)]
      binary >= 10      -> ["double blink"|aux_commands(code-2)]
      binary >= 1       -> ["wink"|aux_commands(code-1)]
      true              -> []
    end
  end

end
