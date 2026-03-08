module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError unless strand1.length == strand2.length
    strand1.chars.each_with_index.count do |char, index|
            char != strand2[index]
    end
  end
end