defmodule Scrabble do
  @points_table [
    {~c"AEIOULNRST", 1},
    {~c"DG", 2},
    {~c"BCMP", 3},
    {~c"FHVWY", 4},
    {~c"K", 5},
    {~c"JX", 8},
    {~c"QZ", 10}
  ]
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) when is_binary(word), do: calc(word)

  defp calc(word, score \\ 0)

  Enum.each(@points_table, fn {letters, points} ->
    Enum.each(letters, fn letter ->
      defp calc(<<unquote(letter + (?a - ?A)), word::binary>>, score),
        do: calc(word, score + unquote(points))

      defp calc(<<unquote(letter), word::binary>>, score),
        do: calc(word, score + unquote(points))
    end)
  end)

  defp calc(<<_, word::binary>>, score), do: calc(word, score)
  defp calc(<<>>, score), do: score
end
