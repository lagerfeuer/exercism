defmodule Pangram do
  @alphabet ?a..?z
  |> Enum.to_list()
  |> List.to_string()
  |> String.codepoints()
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) when is_binary(sentence) do
    letters = sentence
    |> String.downcase()
    |> String.codepoints()

    length(
      @alphabet -- letters
    ) == 0
  end
end
