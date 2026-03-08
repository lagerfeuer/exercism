defmodule CollatzConjecture do
  defguardp is_positive(number) when is_integer(number) and number > 0
  defguardp is_even(number) when is_integer(number) and rem(number, 2) == 0

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_positive(input) do
    input
    |> Stream.iterate(&collatz/1)
    |> Stream.take_while(&(&1 != 1))
    |> Enum.count()
  end

  defp collatz(input) when is_even(input), do: div(input, 2)
  defp collatz(input), do: input * 3 + 1
end
