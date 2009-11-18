require 'jcode'
def fact(n)
	if n == 0
		1
	else
		n * fact(n-1)
	end
end
answer = 0
fact(100).to_s.each_char { |i| answer += i.to_i }
puts answer
command = "echo '"+answer.to_s+"' | pbcopy"
exec(command)
