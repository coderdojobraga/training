defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @spec modifier(pos_integer()) :: integer()
  def modifier(score) do

  end

  @spec ability :: pos_integer()
  def ability do

  end

  @spec character :: t()
  def character do
    #character = %t{}
  end

  def dices() do
    Stream.repeatedly(fn -> :rand.uniform(6) end)
    |> Stream.uniq
    |> Enum.take(4)
    |> remove_min
    |> Enum.sum
  end

  def remove_min([h|t]) do
    List.delete([h|t],min_list(t,h))
  end

  def min_list([], min), do: min
  def min_list([h|t], min) do
    if h < min do
      min_list(t,h)
    else
      min_list(t,min)
    end
  end

end
