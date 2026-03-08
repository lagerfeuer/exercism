defmodule Pangram do
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
    sentence
    |> String.downcase()
    |> String.codepoints()
    |> Enum.reduce(MapSet.new(), fn
      <<letter>>, acc when letter in ?a..?z -> MapSet.put(acc, letter)
      _, acc -> acc
    end)
    |> MapSet.size()
    |> Kernel.==(26)
  end
end
