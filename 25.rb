one = 1
two = 1
answer = 2
while two.to_s.length < 1000
	temp = one+two
	one = two
	two = temp
	answer += 1
end

puts answer
command = "echo '"+answer.to_s+"' | pbcopy"
exec(command)
