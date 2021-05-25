defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    years = seconds/31557600;
    case planet do
      :mercury -> years/0.2408467
      :venus   -> years/0.61519726
      :mars    -> years/1.8808158
      :jupiter -> years/11.862615
      :saturn  -> years/29.447498
      :uranus  -> years/84.016846
      :neptune -> years/164.79132
      _        -> years
    end
  end
end
