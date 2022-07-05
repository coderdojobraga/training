defmodule ResistorColor do
  @moduledoc false

  @spec colors() :: list(String.t())
  def colors() do
    [
      "black",
      "brown",
      "red",
      "orange",
      "yellow",
      "green",
      "blue",
      "violet",
      "grey",
      "white"
    ]
  end


  @spec code(String.t()) :: integer()
  def code(color) do
    get_index(0,color,colors())
  end

  def get_index(i,color,[h|t]) do
    if color == h do
      i
    else
      get_index(i+1,color,t)
    end
  end

end
