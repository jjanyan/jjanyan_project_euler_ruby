class Helper
	attr_accessor :percent
	def initialize
		@start = Time.new
		@percent = 0
	end
	def stop
		@stop = Time.new
	end
	def print_time
		puts '',(@stop-@start).to_s+" seconds"
	end
	def clear()
		print "\e[2J\e[f" 
	end
	def progress(current_percent,num_items,total_items)
		new_percent = (num_items.to_f/total_items.to_f*100).floor
		# THIS PRINTS A PROGRESS INDICATOR WHEN PROGRESS HAS BEEN MADE
		if new_percent > current_percent
			self.clear()
			puts ('x'*new_percent)+('.'*(100-new_percent))
		end
		return new_percent
	end
end
class Fourteen
	attr_accessor :saved, :sequence
	def initialize
		@list = Hash.new
		@saved = 0
		@sequence = Array.new
	end
	def go(num)
		result = self.sequence_count(num)
		@list[num] = result
		return result
	end
	def get_sequence(num)
		if num == 1
			return 0
		end
		if num%2 == 0
			@sequence.push((num/2))
			return self.get_sequence(num/2)+1
		else
			@sequence.push((num*3)+1)
			return self.get_sequence((3*num)+1)+1
		end
	end
	def sequence_count(num)
		if num == 1
			return 0
		end
		if @list[num].nil? == false
			@saved += 1
			return @list[num]
		end
		if num%2 == 0
			return self.sequence_count(num/2)+1
		else
			return self.sequence_count((3*num)+1)+1
		end
	end
end

process = Fourteen.new
helper = Helper.new
max = 0
answer = 0
max_check = 1000000
2.upto(max_check) {|i|
	result = process.go(i)
	if result > max
		max = result
		answer = i
	end
	helper.percent = helper.progress(helper.percent,i,max_check)
	#puts process.saved
}
helper.clear
puts "max length is: "+max.to_s
puts "number which produced max length (answer): "+answer.to_s
puts "sequence:"
process.get_sequence(answer)
puts process.sequence.join(',')
helper.stop
helper.print_time
