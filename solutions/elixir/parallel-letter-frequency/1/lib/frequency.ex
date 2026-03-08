defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Enum.map(&Task.async(fn -> frequency_worker(&1) end))
    |> Enum.map(&Task.await(&1))
    |> Enum.reduce(%{}, &Map.merge(&1, &2, fn _, a, b -> a + b end))
  end

  @spec frequency_worker(String.t()) :: map
  defp frequency_worker(text) do
    text
    |> String.downcase()
    |> String.graphemes()
    |> Stream.reject(&String.match?(&1, ~r/\s|\p{P}|\p{S}|[0-9]/))
    |> Enum.reduce(%{}, fn
      char, acc ->
        Map.update(acc, char, 1, &(&1 + 1))
    end)
  end
end
