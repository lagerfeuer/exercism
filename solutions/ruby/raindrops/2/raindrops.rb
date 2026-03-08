module BookKeeping
  VERSION = 3
end

class Raindrops
  @@table = { 3 => "Pling", 5 => "Plang", 7 => "Plong" }
  def self.convert(num)
    result = @@table.select{|key, word| num % key == 0}.values
    return result.empty? ? num.to_s : result.join()
  end
end
