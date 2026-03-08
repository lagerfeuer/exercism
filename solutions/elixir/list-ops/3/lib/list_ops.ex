defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l) do
    foldl(l, 0, fn _, acc -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    foldl(l, [], fn x, acc -> [x | acc] end)
  end

  @spec map(list, (any -> any)) :: list
  def map([head | tail], f) do
    [f.(head) | map(tail, f)]
  end

  def map([], _), do: []

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([head | tail], f) do
    case !!f.(head) do
      true -> [head | filter(tail, f)]
      false -> filter(tail, f)
    end
  end

  def filter([], _), do: []

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([head | tail], acc, f) do
    foldl(tail, f.(head, acc), f)
  end

  def foldl([], acc, _), do: acc

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr([head | tail], acc, f) do
    f.(head, foldr(tail, acc, f))
  end

  def foldr([], acc, _), do: acc

  @spec append(list, list) :: list
  def append(a, b) do
    foldr(a, b, fn x, acc -> [x | acc] end)
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    foldr(ll, [], &append/2)
  end
end
