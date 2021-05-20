defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist
    |> Enum.map(fn(char) -> add(char,shift) end)
    |> List.to_string
  end

  # ?a == 97, ?z == 122
  defp add(char, shift) when char in ?a..?z do
    rem((char - ?a + shift), 26) + ?a
  end
  defp add(char, shift) when char in ?A..?Z do
    rem(char - ?A + shift, 26) + ?A
  end
  defp add(char, _), do: char

end
