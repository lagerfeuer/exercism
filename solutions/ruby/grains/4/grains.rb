class Grains
  RANGE = (1..64)

  def self.square(field)
    raise ArgumentError unless RANGE.include?(field)
    1 << (field - 1)
  end

  def self.total
    total_grains = 0
    RANGE.each do |field|
      total_grains |= (1 << (field - 1))
    end
    total_grains
  end
end
