defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(" ")
    |> Enum.filter(fn word -> word != "-" end)
    |> Enum.map(fn word -> if String.first(word) == "_" do String.slice(word,1,word.length) end end)
    |> Enum.map(fn word -> String.capitalize(String.first(word)) end)
    |> List.to_string()
  end
end
