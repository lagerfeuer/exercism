module BookKeeping
  VERSION = 3
end

class Raindrops
  @table = { 3 => "Pling", 5 => "Plang", 7 => "Plong" }
  def self.convert(num)
    result = ""
    @table.each do |key, word|
      if num % key == 0
        result << word
      end
    end
    if result.empty?
      return num.to_s
    end
    return result
  end
end
