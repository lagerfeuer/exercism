class Grains
  def self.square(num)
    raise ArgumentError unless num > 0 and num <= 64
    1 << (num - 1)
  end

  def self.total
    (1..64).sum {|num| square(num)}
  end
end
