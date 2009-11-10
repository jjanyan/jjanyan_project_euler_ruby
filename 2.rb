total = 0
first = 1
second = 2

while second < 4000000
	if second.even?
		total += second
	end
	temp = second
	second = first+second
	first = temp
end
puts total
