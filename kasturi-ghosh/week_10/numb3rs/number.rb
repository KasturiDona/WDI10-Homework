class Number
	def self.bin2dec( bin )
		number = 0
		power = 0
		bin.chars.reverse.each do |bit|
			bit = bit.to_i
			number += (bit * 2 ** power)
			power += 1
		end
		number
		# bin.chars.reverse.each_with_index.map { |b, i| (b.to_i * 2**i) }.reduce(:+)
	end

	def self.dec2bin( dec )
		num = []
		until dec == 1 do 
			rem = dec % 2
			dec = dec / 2
			num << rem
		end
		num << dec
		num.reverse!
		num.join ''

	end

	def self.bin2hex( bin )
		final = []
		c = bin.length
		rem = c % 4
		num = '000' << bin if rem = 1
		num = '00' << bin if rem = 2
		num = '0' << bin if rem = 3

		num = num.split ''

		until num.length == 0 do 
			number = 0
			power = 0
			
			part = num.pop(4)
			part = part.join ''

			part.chars.reverse.each do |bit|
				bit = bit.to_i
				number += (bit * 2 ** power)
				power += 1
			end

			number = 'a' if number == 10
			number = 'b' if number == 11
			number = 'c' if number == 12
			number = 'd' if number == 13
			number = 'e' if number == 14
			number = 'f' if number == 15

			final << number
		end

		final.reverse!
		final.join ''

	end

	def self.hex2bin( hex )
		number = []
		hex.chars.each do |bit|
			num = '0000' if bit == '0'
			num = '0001' if bit == '1'
			num = '0010' if bit == '2'
			num = '0011' if bit == '3'
			num = '0100' if bit == '4'
			num = '0101' if bit == '5'
			num = '0110' if bit == '6'
			num = '0111' if bit == '7'
			num = '1000' if bit == '8'
			num = '1001' if bit == '9'
			num = '1010' if bit == 'a'
			num = '1011' if bit == 'b'
			num = '1100' if bit == 'c'
			num = '1101' if bit == 'd'
			num = '1110' if bit == 'e'
			num = '1111' if bit == 'f'

			number << num
		end
		
		number = number.join ''
		number = number.split ''

		until number.first == '1'
			number.shift
		end

		number.join ''
	end
end