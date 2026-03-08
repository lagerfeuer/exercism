defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers))
  end

  defp search(_, _, idx_start, idx_end) when idx_start == idx_end, do: :not_found

  defp search(numbers, key, idx_start, idx_end) do
    middle = div(idx_start + idx_end, 2)
    value = elem(numbers, middle)

    cond do
      value == key -> {:ok, middle}
      value < key -> search(numbers, key, middle + 1, idx_end)
      value > key -> search(numbers, key, idx_start, middle)
    end
  end
end
