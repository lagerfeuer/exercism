defmodule Squares do
  defguardp is_pos_integer(x) when is_integer(x) and x > 0

  @moduledoc """
  Calculate sum of squares, square of sum, difference between two sums from 1 to a given end number.
  """

  @doc """
  Calculate sum of squares from 1 to a given end number.
  """
  @spec sum_of_squares(pos_integer) :: pos_integer
  def sum_of_squares(number) when is_pos_integer(number),
    do: number * (number + 1) * (2 * number + 1) / 6

  @doc """
  Calculate square of sum from 1 to a given end number.
  """
  @spec square_of_sum(pos_integer) :: pos_integer
  def square_of_sum(number) when is_pos_integer(number),
    do: Integer.pow(number * (number + 1), 2) / 4

  @doc """
  Calculate difference between sum of squares and square of sum from 1 to a given end number.
  """
  @spec difference(pos_integer) :: pos_integer
  def difference(number) when is_pos_integer(number),
    do: square_of_sum(number) - sum_of_squares(number)
end
