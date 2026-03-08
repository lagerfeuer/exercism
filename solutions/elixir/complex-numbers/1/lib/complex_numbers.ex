defmodule ComplexNumbers do
  @typedoc """
  In this module, complex numbers are represented as a tuple-pair containing the real and
  imaginary parts.
  For example, the real number `1` is `{1, 0}`, the imaginary number `i` is `{0, 1}` and
  the complex number `4+3i` is `{4, 3}'.
  """
  @type complex :: {float, float}

  @doc """
  Return the real part of a complex number
  """
  @spec real(a :: complex) :: float
  def real({r, _i}), do: r

  @doc """
  Return the imaginary part of a complex number
  """
  @spec imaginary(a :: complex) :: float
  def imaginary({_r, i}), do: i

  @doc """
  Multiply two complex numbers, or a real and a complex number
  """
  @spec mul(a :: complex | float, b :: complex | float) :: complex
  def mul({r1, i1}, {r2, i2}), do: {r1 * r2 - i1 * i2, r1 * i2 + r2 * i1}
  def mul({r, i}, num), do: mul({r, i}, {num, 0})
  def mul(num, {r, i}), do: mul({num, 0}, {r, i})
  def mul(num1, num2), do: mul({num1, 0}, {num2, 0})

  @doc """
  Add two complex numbers, or a real and a complex number
  """
  @spec add(a :: complex | float, b :: complex | float) :: complex
  def add({r1, i1}, {r2, i2}), do: {r1 + r2, i1 + i2}
  def add({r, i}, num), do: add({r, i}, {num, 0})
  def add(num, {r, i}), do: add({num, 0}, {r, i})
  def add(num1, num2), do: add({num1, 0}, {num2, 0})

  @doc """
  Subtract two complex numbers, or a real and a complex number
  """
  @spec sub(a :: complex | float, b :: complex | float) :: complex
  def sub({r1, i1}, {r2, i2}), do: {r1 - r2, i1 - i2}
  def sub({r, i}, num), do: sub({r, i}, {num, 0})
  def sub(num, {r, i}), do: sub({num, 0}, {r, i})
  def sub(num1, num2), do: sub({num1, 0}, {num2, 0})

  @doc """
  Divide two complex numbers, or a real and a complex number
  """
  @spec div(a :: complex | float, b :: complex | float) :: complex
  def div({r1, i1}, {r2, i2}),
    do: {(r1 * r2 + i1 * i2) / (r2 * r2 + i2 * i2), (r2 * i1 - r1 * i2) / (r2 * r2 + i2 * i2)}

  def div({r, i}, num), do: ComplexNumbers.div({r, i}, {num, 0})
  def div(num, {r, i}), do: ComplexNumbers.div({num, 0}, {r, i})
  def div(num1, num2), do: ComplexNumbers.div({num1, 0}, {num2, 0})

  @doc """
  Absolute value of a complex number
  """
  @spec abs(a :: complex) :: float
  def abs({r, i}), do: :math.sqrt(r * r + i * i)

  @doc """
  Conjugate of a complex number
  """
  @spec conjugate(a :: complex) :: complex
  def conjugate({r, i}), do: {r, -i}

  @doc """
  Exponential of a complex number
  """
  @spec exp(a :: complex) :: complex
  def exp({r, i}), do: {:math.exp(r) * :math.cos(i), :math.exp(r) * :math.sin(i)}
end
