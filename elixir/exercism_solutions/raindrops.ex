defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    factors = Raindrops.factors(number,1)
    aux_convert(number,factors,0)
  end

  def aux_convert(number,factors,flag) do
    cond do
      Enum.member?(factors,3) -> "Pling" <> aux_convert(number,List.delete(factors,3),1)
      Enum.member?(factors,5) -> "Plang" <> aux_convert(number,List.delete(factors,5),1)
      Enum.member?(factors,7) -> "Plong" <> aux_convert(number,List.delete(factors,7),1)
      flag == 1               -> ""
      true                    -> Integer.to_string(number)
    end
  end

  def factors(n, i) when n == i do [i] end
  def factors(n, i) do
    if rem(n, i) == 0 do
      [i|factors(n, i+1)]
    else
      factors(n, i+1)
    end
  end

end
