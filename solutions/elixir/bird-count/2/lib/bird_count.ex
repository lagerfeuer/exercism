defmodule BirdCount do
  def today([]), do: nil
  def today([n | _]), do: n

  def increment_day_count([]), do: [1]
  def increment_day_count([n | list]) when is_number(n), do: [n + 1 | list]

  def has_day_without_birds?([x | list]) when is_number(x) and x > 0,
    do: has_day_without_birds?(list)

  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([]), do: false

  def total(list), do: total(list, 0)

  defp total([x | list], acc), do: total(list, acc + x)
  defp total([], acc), do: acc

  def busy_days(list), do: busy_days(list, 0)

  defp busy_days([x | list], acc) when is_number(x) and x >= 5, do: busy_days(list, acc + 1)
  defp busy_days([x | list], acc) when is_number(x), do: busy_days(list, acc)
  defp busy_days([], acc), do: acc
end
