max_size = 999
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
puts result
