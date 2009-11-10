#original_num = 600851475143

puts "please enter a number to factor"
original_num = gets.chomp.to_i
num = original_num
done = false
pointer = 2
list = Array.new

while !done
	if(num%pointer == 0)
		list = list << pointer
		num = num/pointer
		if(num == 1)
			done = true
		end
		pointer = 2
		sleep 0.2
	else
		pointer += 1
	end
end
puts "\nyour factors are:"
puts list
