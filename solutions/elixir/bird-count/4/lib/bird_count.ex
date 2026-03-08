defmodule BirdCount do
  @threshold_busy_day 5

  def today([]), do: nil
  def today([birds | _]), do: birds

  def increment_day_count([]), do: [1]
  def increment_day_count([birds | days]) when is_number(birds), do: [birds + 1 | days]

  def has_day_without_birds?([birds | days]) when is_number(birds) and birds > 0,
    do: has_day_without_birds?(days)

  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([]), do: false

  def total(days), do: total(days, 0)

  defp total([birds | days], total), do: total(days, total + birds)
  defp total([], total), do: total

  def busy_days(days), do: busy_days(days, 0)

  defp busy_days([birds | days], busy_days)
       when is_number(birds) and birds >= @threshold_busy_day,
       do: busy_days(days, busy_days + 1)

  defp busy_days([birds | days], busy_days) when is_number(birds),
    do: busy_days(days, busy_days)

  defp busy_days([], busy_days), do: busy_days
end
