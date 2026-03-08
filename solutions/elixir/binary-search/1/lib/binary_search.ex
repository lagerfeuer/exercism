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

  defp search(numbers, _, _, _) when tuple_size(numbers) == 0, do: :not_found
  defp search(numbers, _, idx_start, _) when tuple_size(numbers) == idx_start, do: :not_found

  defp search(numbers, key, idx_start, idx_end)
       when idx_start == idx_end,
       do: if(elem(numbers, idx_start) == key, do: {:ok, idx_start}, else: :not_found)

  defp search(numbers, key, idx_start, idx_end) do
    middle = div(idx_start + idx_end, 2)

    case elem(numbers, middle) do
      ^key -> {:ok, middle}
      n when n > key -> search(numbers, key, idx_start, middle - 1)
      _ -> search(numbers, key, middle + 1, idx_end)
    end
  end
end
