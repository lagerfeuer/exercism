module BookKeeping
  VERSION = 4
end

class Squares
  def initialize(num)
    @square_of_sum = (0..num).sum ** 2
    @sum_of_squares = (0..num).sum {|e| e ** 2}
    @difference = @square_of_sum - @sum_of_squares
  end

  def square_of_sum
    @square_of_sum
  end

  def sum_of_squares
    @sum_of_squares
  end

  def difference
    @difference
  end
end

