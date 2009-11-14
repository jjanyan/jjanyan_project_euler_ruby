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

max = 1000
result = Array.new()

1.upto(max-2) { |i|
	1.upto(max-2) { |j|
		k = max-i-j
		if k < 1
			break
		end
		if (i*i + j*j) == (k*k)
			result = [i,j,k]
		end
	}
}





clear()
puts "the pieces are: "+result.join(',')
sum = 1
result.each { |i| sum *= i }
sum = sum.to_s
puts "answer is: "+sum
command = "growlnotify -t '"+$0.to_s+"' -m '"+sum+"'"
exec(command)
