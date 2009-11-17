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
helper = Helper.new

num = '7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450'

max = 0
list = Array
num = num.split('').map(&:to_i)
length = num.length-5

1.upto(length) { |i|
	temp = num[i,5]
	temp.each_index{ |x|
		if x.to_i == 0
			break
		end
		temp[x] = temp[x].to_i
	}
	product = 1
	temp.each{ |a| product = product * a}
	if product > max
		max = product
		list = temp
	end
}
puts max
helper.stop
helper.print_time
