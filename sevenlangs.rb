range = 10
puts "Choose a number from 1 to #{range}"
num = 0
i = rand(10) + 1
puts "#{i}"
until num == i
	num = gets().to_i
	if num < i
		puts "HIGHER"
	elsif num > i
		puts "lower"
	else
		puts "You got it!"
	end
end

