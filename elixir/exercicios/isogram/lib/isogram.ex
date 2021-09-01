defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.downcase(:ascii)
    |> String.split("",trim: true)
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    |> Map.delete(" ")
    |> Map.delete("-")
    |> Map.values()
    |> aux_isogram?()
  end

  def aux_isogram?([]), do: true
  def aux_isogram?([h|t]) do
    case h do
      1 -> aux_isogram?(t)
      _ -> false
    end
  end
end
