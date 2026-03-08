import Bitwise

defmodule Allergies do
  @allergens ~w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]
  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags) do
    @allergens |> Stream.filter(&allergic_to?(flags, &1)) |> Enum.to_list()
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    (flags &&& 1 <<< Enum.find_index(@allergens, &(&1 == item))) != 0
  end
end
