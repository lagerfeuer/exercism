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
    search(numbers, key, {0, tuple_size(numbers) - 1})
  end

  defp search(_, _, {idx_start, idx_end}) when idx_start > idx_end, do: :not_found

  defp search(numbers, key, {idx_start, idx_end}) do
    div(idx_start + idx_end, 2)
    |> then(fn idx_mid ->
      case elem(numbers, idx_mid) do
        ^key -> {:ok, idx_mid}
        left_of when left_of < key -> search(numbers, key, {idx_mid + 1, idx_end})
        _right_of -> search(numbers, key, {idx_start, idx_mid - 1})
      end
    end)
  end
end
