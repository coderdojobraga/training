defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""
  def encode(string) do
    char = String.at(string, 0)
    list = String.codepoints(string)
    count = countWhile(list,char)
    if count == 1 do
      char <> encode(String.slice(string, countWhile(list,char), String.length(string)))
    else
      Integer.to_string(count) <> char <> encode(String.slice(string, countWhile(list,char), String.length(string)))
    end
  end

  @spec decode(String.t()) :: String.t()
  def decode(""), do: ""
  def decode(string) do
    count  = string
           |> String.codepoints
           |> countWhileNumber
    if count > 0 do
      letter = String.at(string, count)
      no_elements = string
                  |> String.slice(0,count)
                  |> String.to_integer
      replicate(no_elements-1, letter) <> decode(String.slice(string,count,String.length(string)))
    else
      String.at(string, 0) <> decode(String.slice(string,1,String.length(string)))
    end
  end

  def countWhileNumber([]), do: 0
  def countWhileNumber([h|t]) do
    if Regex.match?(~r{\A\d*\z}, h) do
      1 + countWhileNumber(t)
    else
      0
    end
  end

  def replicate(0,_char), do: ""
  def replicate(n, char) do
      char <> replicate(n-1, char)
  end

  def countWhile([], _x), do: 0
  def countWhile([h|t], x) do
    if h == x do
      1 + countWhile(t, x)
    else
      0
    end
  end

end
