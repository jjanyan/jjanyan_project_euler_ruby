original_num = 13195
num = original_num
done = false
pointer = 2
list = Array.new

while !done
	puts pointer
	if(num%pointer == 0)
		list = list << pointer
		puts 'added',pointer
		num = num%pointer
		puts 'modified num',num
		pointer = 2
	else
		pointer += 1
	end
end
puts list
