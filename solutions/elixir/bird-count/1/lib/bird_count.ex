defmodule BirdCount do
  def today([]), do: nil
  def today([n | _]), do: n

  def increment_day_count([]), do: [1]
  def increment_day_count([n | list]) when is_number(n), do: [n + 1 | list]

  def has_day_without_birds?([x | list]) when is_number(x) and x > 0,
    do: has_day_without_birds?(list)

  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([]), do: false

  def total(list), do: list |> Enum.sum()

  def busy_days(list), do: list |> Enum.count(&(&1 > 4))
end
