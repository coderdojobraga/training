defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(0, _factors), do: 0
  def to(limit, factors) do
    if is_multiple_of_any_factor(limit,factors) do
      limit + to(limit-1,factors)
    else
      to(limit-1,factors)
    end
  end

  def is_multiple_of_any_factor(_number,[]), do: false
  def is_multiple_of_any_factor(number,[h|t]) do
    rem(number, h) == 0 || is_multiple_of_any_factor(number, t)
  end
end
