class Grains
  # board has 64 fields, i.e. range 1-64 is valid
  MIN = 1
  MAX = 64
  def self.square(field)
    raise ArgumentError unless (MIN..MAX).include?(field)
    1 << (field - 1)
  end

  def self.total
    square(MAX) * 2 - 1
  end
end
