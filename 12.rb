def get_triangle_number(num)
	total = 0
	1.upto(num) { |i|
		total += i
	}
	return total
end
def get_divisors_count(num)
	count = 0
	2.upto((Math.sqrt(num)).floor) { |i|
		if num%i == 0
			count += 1
		end
	}
	count = count * 2
	return count
end

num_div = 500
number = 2
count = 0
until (count = get_divisors_count(get_triangle_number(number))) > num_div
	number += 1	
end
#puts count.to_s+"\t"+number.to_s

puts '','the answer is: '+get_triangle_number(number).to_s
