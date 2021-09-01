defmodule Bob do

  def hey(input) do
    cond do
      input
      |> split(&Bob.question?()/1, &Bob.screaming?()/1)
      |> intersect?     -> "Calm down, I know what I'm doing!"
      silence?(input)   -> "Fine. Be that way!"
      screaming?(input) -> "Whoa, chill out!"
      question?(input)  -> "Sure."
      true              -> "Whatever."
    end
  end

  def screaming?(s) do
    String.match?(s, ~r(^[^a-z]*$)) && has_letter?(String.to_charlist(s))
  end

  def has_letter?([]), do: false
  def has_letter?([h|t]) do
    Enum.member?(?A..?Z,h)
    || String.match?(List.to_string([h]),~r/^\p{L}$/u)
    || has_letter?(t)
  end

  def silence?(s) do
    s
    |> String.trim()
    |> Kernel.==("")
  end

  def question?(s) do
    s
    |> String.trim()
    |> String.ends_with?("?")
  end

  def split(x,f,g), do: {f.(x), g.(x)}

  def intersect?({x,y}), do: x && y

end
