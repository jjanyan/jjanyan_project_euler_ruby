puts "number of max digits"
max_digits = gets.chomp.to_i

max_size = ("9"*max_digits).to_i
result = 1

max_size.downto(1) { |i|
	max_size.downto(1) { |j|
		product = i*j
		if product > result
			product_string = product.to_s
			if product_string == product_string.reverse
				result = product
			end
		end
	}
}
puts "largest palindrome for "+max_digits.to_s+" digits is:"
puts result
