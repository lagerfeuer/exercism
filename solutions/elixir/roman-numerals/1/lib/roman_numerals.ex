defmodule RomanNumerals do
  @numerals [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  defp numeral(_, [], acc), do: acc

  defp numeral(number, [{arabic, roman} | tail], acc) do
    if number >= arabic do
      numeral(number - arabic, [{arabic, roman} | tail], acc <> roman)
    else
      numeral(number, tail, acc)
    end
  end

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    numeral(number, @numerals, "")
  end
end
