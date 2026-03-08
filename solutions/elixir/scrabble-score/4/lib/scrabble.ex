defmodule Scrabble do
  @letters_and_points [
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
  def score(word) when is_binary(word), do: points(word)

  defp points(word, score \\ 0)

  Enum.each(@letters_and_points, fn {letters, points} ->
    Enum.each(letters, fn uppercase ->
      defp points(<<unquote(uppercase), word::binary>>, score),
        do: points(word, score + unquote(points))

      lowercase = uppercase + (?a - ?A)
      defp points(<<unquote(lowercase), word::binary>>, score),
        do: points(word, score + unquote(points))
    end)
  end)

  defp points(<<_, word::binary>>, score), do: points(word, score)
  defp points(<<>>, score), do: score
end
