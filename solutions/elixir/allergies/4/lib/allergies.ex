import Bitwise

defmodule Allergies do
  @allergens ~w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags), do: @allergens |> Enum.filter(&allergic_to?(flags, &1))

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  for {allergen, index} <- Enum.with_index(@allergens) do
    def allergic_to?(flags, unquote(allergen)), do: flag_set?(flags, unquote(index))
  end

  def allergic_to?(_flags, _item), do: false

  @spec flag_set?(non_neg_integer, non_neg_integer) :: boolean
  defp flag_set?(flags, index), do: (flags &&& 1 <<< index) != 0
end
