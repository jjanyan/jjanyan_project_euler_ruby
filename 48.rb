num = 1000
total = 0
1.upto(num) { |i| total += i**i }
puts total.to_s[-10,10]
