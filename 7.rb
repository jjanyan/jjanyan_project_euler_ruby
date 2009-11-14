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
	clear()
	new_percent = (num_items.to_f/total_items.to_f*100).floor
	# THIS PRINTS A PROGRESS INDICATOR WHEN PROGRESS HAS BEEN MADE
	if new_percent > current_percent
		puts ('x'*new_percent)+('.'*(100-new_percent))
	end
	return new_percent
end

puts "find nth prime number:"
number = gets.chomp.to_i
puts '','',''
count = 0
start = 1
run = true
percent = 0

while run == true
	start += 1
	if is_prime(start) == true
		count += 1
		#puts start
		percent = progress(percent,count,number)
	end
	if count == number
		run = false
	end
end

clear()
puts "answer is: "+start.to_s
command = "growlnotify -t '"+$0.to_s+"' -m '"+start.to_s+"'"
exec(command)
