defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {a1, a2} = a
    {b1, b2} = b
    {a1 * b2 + a2 * b1, a2 * b2} |> reduce
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {a1, a2} = a
    {b1, b2} = b
    {a1 * b2 - a2 * b1, a2 * b2} |> reduce
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {a1, a2} = a
    {b1, b2} = b
    {a1 * b1, a2 * b2} |> reduce
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {a1, a2} = num
    {b1, b2} = den
    {a1 * b2, a2 * b1} |> reduce
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {a1, a2} = a
    reduce({Kernel.abs(a1), Kernel.abs(a2)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    {a1, a2} = a
    m = Kernel.abs(n)

    cond do
      n == m -> {Integer.pow(a1, n), Integer.pow(a2, n)}
      true -> {Integer.pow(a2, m), Integer.pow(a1, m)}
    end
    |> reduce
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {n1, n2} = n

    cond do
      n1 < 0 -> Float.pow(Integer.pow(x, -n1) * 1.0, -1 / n2)
      true -> Float.pow(Integer.pow(x, n1) * 1.0, 1 / n2)
    end
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    {a1, a2} = a

    g = Integer.gcd(a1, a2)

    {r1, r2} = {(a1 / g) |> round, (a2 / g) |> round}

    if r2 < 0 do
      {-r1, -r2}
    else
      {r1, r2}
    end
  end
end
