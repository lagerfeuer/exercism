defmodule Frequency do
  @ignore " \t\n\r\n'\"0123456789!?;:,.+-()" |> String.codepoints()
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Task.async_stream(&count_letters/1, max_concurrency: workers)
    |> Stream.filter(fn
      {:ok, _} -> true
      _ -> false
    end)
    |> Enum.reduce(%{}, fn {:ok, frequencies}, acc ->
      Map.merge(acc, frequencies, fn _, a, b -> a + b end)
    end)
  end

  @spec count_letters(String.t()) :: map
  defp count_letters(text, frequencies \\ Map.new())

  defp count_letters(<<first::utf8, rest::binary>>, frequencies) do
    with <<curr::utf8>> <- String.downcase(<<first::utf8>>) do
      case Enum.member?(@ignore, <<curr::utf8>>) do
        false ->
          count_letters(rest, Map.update(frequencies, <<curr::utf8>>, 1, &(&1 + 1)))

        true ->
          count_letters(rest, frequencies)
      end
    end
  end

  defp count_letters(<<>>, frequencies), do: frequencies
end
