
def get_triangle_number(num)
	total = 0
	1.upto(num) { |i|
		total += i
	}
	return total
end

def get_divisors_count(num)
	# START OFF AT 2, SINCE ALL NUMBERS, EXCEPT 1 HAVE 2 DIVISORS
	if num != 1
		count = 2
	else
		count = 1
	end
	max = (num/2).floor
	2.upto(max) { |i|
		if num%i == 0
			count += 1
		end
	}
	return count
end

number = 1
until (count = get_divisors_count(get_triangle_number(number))) > 5
	number += 1	
end

puts
puts get_triangle_number(number)
