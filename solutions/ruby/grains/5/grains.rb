class Grains
  def self.square(field)
    raise ArgumentError unless (1..64).include?(field)
    1 << (field - 1)
  end

  def self.total
    square(64) * 2 - 1
  end
end
