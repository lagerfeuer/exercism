defmodule Scrabble do
  @points_table [
    {"AEIOULNRST", 1},
    {"DG", 2},
    {"BCMP", 3},
    {"FHVWY", 4},
    {"K", 5},
    {"JX", 8},
    {"QZ", 10}
  ]
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> String.codepoints()
    |> Stream.map(&value/1)
    |> Enum.sum()
  end

  Enum.each(@points_table, fn {letters, points} ->
    Enum.each(String.codepoints(letters), fn letter ->
      defp value(unquote(letter)), do: unquote(points)
    end)
  end)
  defp value(_), do: 0
end
