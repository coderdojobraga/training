defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    sentence
    |> String.downcase(:ascii)
    |> String.split("",trim: true)
    |> Enum.filter(fn char -> String.match?(char, ~r/^[a-z]$/) end)
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    |> Kernel.map_size()
    |> Kernel.==(26)
  end

end
