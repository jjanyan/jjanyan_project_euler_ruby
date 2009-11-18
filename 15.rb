# number of routes going only left or down in a 20x20 grid, starting at top left, finishing at the bottom right
# D,D,D,D,D,D,D,D,D,D,R,R,R,R,R,R,R,R,R,R
# D,D,D,D,D,D,D,D,D,R,D,R,R,R,R,R,R,R,R,R
# R,R,R,R,R,R,R,R,R,R,D,D,D,D,D,D,D,D,D,D
# etc..
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

class Recusion
	attr_accessor :size
	def initialize
		@size = 10
	end
	def go(path)
		if path.count_right > @size or path.count_down > @size
			return 0
		end
		if path.count_right == @size and path.count_down == @size
			return 1
		end
		total = 0
		right = path.clone().increment_right
		down = path.clone().increment_down
		total += self.go(right)
		total += self.go(down)
		return total
	end
end
class Path
	attr_accessor :count_right, :count_down, :path
	def initialize()
		@count_right = 0
		@count_down = 0
		@path = Array.new
	end
	def increment_right()
		@count_right += 1
		@path.push('right')
		return self
	end
	def increment_down()
		@count_down += 1
		@path.push('down')
		return self
	end
end

timer = Helper.new
recursion = Recusion.new
path = Path.new
puts recursion.go(path)
timer.stop
timer.print_time
