def is_prime(num)
	halfway = Math.sqrt(num).floor
	if num%2 == 0 and num != 2
		return false
	end
	3.upto(halfway) { |i|
		if num%i == 0
			return false
		end
	}
	return true
end
def clear()
	print "\e[2J\e[f" 
end
def progress(current_percent,num_items,total_items)
	new_percent = (num_items.to_f/total_items.to_f*100).floor
	# THIS PRINTS A PROGRESS INDICATOR WHEN PROGRESS HAS BEEN MADE
	if new_percent > current_percent
		clear()
		puts ('x'*new_percent)+('.'*(100-new_percent))
	end
	return new_percent
end

puts "find the sum of prime numbers up to:"
number = gets.chomp.to_i

percent = 0
sum = 0

2.upto(number) { |i|
	if is_prime(i) == true
		sum += i
	end
	percent = progress(percent,i,number)
}

#clear()
result = sum.to_s
puts "answer is: "+result
command = "growlnotify -t '"+$0.to_s+"' -m '"+result+"'"
exec(command)
