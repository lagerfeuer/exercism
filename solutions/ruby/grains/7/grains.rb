class Grains
  BOARD_SIZE = 64
  def self.square(field)
    raise ArgumentError unless (1..BOARD_SIZE).include?(field)
    1 << (field - 1)
  end

  def self.total
    square(BOARD_SIZE) * 2 - 1
  end
end
