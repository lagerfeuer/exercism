class Grains
  def self.square(field)
    raise ArgumentError unless field > 0 and field <= 64
    1 << (field - 1)
  end

  def self.total
    total_grains = 0
    (1..64).each do |field|
      total_grains |= (1 << (field - 1))
    end
    total_grains
  end
end
