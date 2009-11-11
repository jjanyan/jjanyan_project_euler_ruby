puts "find natural differences from 1 to..."
number = gets.chomp.to_i
sum_square = 0
square_sum = 0

1.upto(number) { |i|
	sum_square += i**2
	square_sum += i
}

difference = square_sum**2 - sum_square

puts ''
puts difference
command = "growlnotify -t '"+$0.to_s+"' -m '"+difference.to_s+"'"
exec(command)
