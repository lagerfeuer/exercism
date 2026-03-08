defmodule BirdCount do
  @busy_day_threshold 5

  def today([]), do: nil
  def today([birds | _]), do: birds

  def increment_day_count([]), do: [1]
  def increment_day_count([birds | days]) when is_number(birds), do: [birds + 1 | days]

  def has_day_without_birds?([birds | days]) when is_number(birds) and birds > 0,
    do: has_day_without_birds?(days)

  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([]), do: false

  def total(days), do: total(days, 0)

  defp total([birds | days], sum), do: total(days, sum + birds)
  defp total([], sum), do: sum

  def busy_days(days), do: busy_days(days, 0)

  defp busy_days([birds | days], sum_busy_days)
       when is_number(birds) and birds >= @busy_day_threshold,
       do: busy_days(days, sum_busy_days + 1)

  defp busy_days([birds | days], sum_busy_days) when is_number(birds),
    do: busy_days(days, sum_busy_days)

  defp busy_days([], sum_busy_days), do: sum_busy_days
end
