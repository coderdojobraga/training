defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep([h|t], fun) do
    if (fun.(h)) do
      [h|keep(t,fun)]
    else
      keep(t,fun)
    end
  end
  def keep([], _), do: []

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard([h|t], fun) do
    if(fun.(h)) do
      discard(t,fun)
    else
      [h|discard(t,fun)]
    end
  end
  def discard([], _), do: []
end
