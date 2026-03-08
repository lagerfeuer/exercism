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

  planet_conversion_rates = [
    {:mercury, 0.2408467},
    {:venus, 0.61519726},
    {:earth, 1.0},
    {:mars, 1.8808158},
    {:jupiter, 11.862615},
    {:saturn, 29.447498},
    {:uranus, 84.016846},
    {:neptune, 164.79132}
  ]

  earth_year = 60 * 60 * 24 * 365.25

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  Enum.each(planet_conversion_rates, fn {planet, rate} ->
    def age_on(unquote(planet), seconds) when is_integer(seconds) and seconds > 0,
      do: {:ok, seconds / unquote(rate) / unquote(earth_year)}
  end)

  def age_on(_, _), do: {:error, "not a planet"}
end
