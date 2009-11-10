def check(num,max)
	max.downto(1) { |i|
		if num%i != 0
			return false
		end
	}
	return true
end

process = true
result = 1
puts "highest number in range to find multiple"
max = gets.chomp.to_i

while process
	if check(result,max)
		process = false
	else
		result += 1
	end
end

puts ''
puts result
command = "growlnotify -t '"+$0.to_s+"' -m '"+result.to_s+"'"
exec(command)
