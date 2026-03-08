module BookKeeping
	VERSION = 3
end
class Hamming
	def self.compute(a, b)
		dif = 0
		if a.length != b.length
			raise ArgumentError
		end
		for index in 0..a.length - 1
			if a[index].chr != b[index].chr
				dif = dif + 1
			end
		end
		dif
	end
end