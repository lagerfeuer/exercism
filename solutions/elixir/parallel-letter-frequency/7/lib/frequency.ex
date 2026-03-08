defmodule Frequency do
  @ignore_list " \t\n\r'\"0123456789!?;:,.+-()" |> String.codepoints()
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Task.async_stream(&count_letters/1, max_concurrency: workers)
    |> Enum.reduce(%{}, fn {:ok, frequencies}, acc ->
      Map.merge(acc, frequencies, fn _, a, b -> a + b end)
    end)
  end

  @spec count_letters(String.t()) :: map
  defp count_letters(text, frequencies \\ Map.new())

  for ignored <- @ignore_list do
    defp count_letters(unquote(ignored) <> text, frequencies),
      do: count_letters(text, frequencies)
  end

  defp count_letters(<<letter::utf8, text::binary>>, frequencies),
    do:
      count_letters(
        text,
        Map.update(frequencies, String.downcase(<<letter::utf8>>), 1, &(&1 + 1))
      )

  defp count_letters(<<>>, frequencies), do: frequencies
end
