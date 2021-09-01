defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(fn word -> translate_word(word) end)
    |> Enum.join(" ")
  end

  def translate_word(word) do
    cond do
      String.starts_with?(word, "ch")  -> word |> String.replace_suffix( "", "ay") |> String.replace_prefix("ch", "")
      String.starts_with?(word, "qu")  -> word |> String.replace_suffix( "", "ay") |> String.replace_prefix("qu", "")
      String.starts_with?(word, "squ") -> word |> String.replace_suffix( "", "ay") |> String.replace_prefix("squ", "")
      String.starts_with?(word, "th")  -> word |> String.replace_suffix( "", "ay") |> String.replace_prefix("th", "")
      String.starts_with?(word, "thr") -> word |> String.replace_suffix( "", "ay") |> String.replace_prefix("thr", "")
      String.starts_with?(word, "sch") -> word |> String.replace_suffix( "", "ay") |> String.replace_prefix("sch", "")
      String.starts_with?(word, "yt")  -> String.replace_suffix(word, "", "ay")
      String.starts_with?(word, "xr")  -> String.replace_suffix(word, "", "ay")
      String.starts_with?(word, "a")   -> String.replace_suffix(word, "", "ay")
      String.starts_with?(word, "e")   -> String.replace_suffix(word, "", "ay")
      String.starts_with?(word, "i")   -> String.replace_suffix(word, "", "ay")
      String.starts_with?(word, "o")   -> String.replace_suffix(word, "", "ay")
      String.starts_with?(word, "u")   -> String.replace_suffix(word, "", "ay")
      true                             -> String.replace_suffix(word,"", String.slice(0,1,word) <> "ay") |> String.slice(1, String.length(word))
    end
  end

end
