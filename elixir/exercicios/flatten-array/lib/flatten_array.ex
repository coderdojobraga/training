defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    list
    |> List.flatten()
    |> remove_nils()
  end

  def remove_nils([]), do: []

  def remove_nils([h|t]) do
    if h == nil do
      remove_nils(t)
    else
      [h|remove_nils(t)]
    end
  end

end
