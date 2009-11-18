require 'jcode'
total = 0
(2**1000).to_s.each_char { |i| total += i.to_i }
puts total
