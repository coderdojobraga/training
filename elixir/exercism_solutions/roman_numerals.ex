defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    cond do
      number >= 1000 -> "M" <> numeral(number-1000)
      number >= 900  -> "CM" <> numeral(number-900)
      number >= 500  -> "D" <> numeral(number-500)
      number >= 400  -> "CD" <> numeral(number-400)
      number >= 100  -> "C" <> numeral(number-100)
      number >= 90   -> "XC" <> numeral(number-90)
      number >= 50   -> "L" <> numeral(number-50)
      number >= 40   -> "XL" <> numeral(number-40)
      number >= 10   -> "X" <> numeral(number-10)
      number >= 9    -> "IX" <> numeral(number-9)
      number >= 5    -> "V" <> numeral(number-5)
      number >= 4    -> "IV" <> numeral(number-5)
      number >= 1    -> "I" <> numeral(number-1)
      true           -> ""
    end
  end
end
