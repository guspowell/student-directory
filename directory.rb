def print_header
	puts "The students of my cohort at Makers Academy"
	puts "--------------"
end

def print(students)
	students.each do |student|
		if student[:name].length < 12
			puts "#{student[:number]}. #{student[:name]} (#{student[:cohort]} cohort) is from #{student[:country].capitalize}"
		end
	end
end

def print_footer(names)
	puts "overall we have #{names.length} great students"
end

def input_students
	puts "please enter the names of the student you wish to add"
	puts "when you are done press enter twice"
	students = []
	# get the first name
	number = 1
	name = gets.chomp
	puts "what cohort is #{name} in?"
	cohort = gets.chomp
	puts "what is #{name}'s country of origin?"
	country = gets.chomp

	# while the name is not empty, repeat this code
	while !name.empty? do
    	# add the student hash to the array
    	students << {:number => number, :name => name, :cohort => cohort, :country => country}
    	puts "now we have #{students.length} great students"
    	# get another name from user
    	puts "please enter another name:"
    	number += 1
    	name = gets.chomp
    	puts "what cohort is #{name} in?"
    	cohort = gets.chomp
		puts "what is #{name}'s country of origin?"    	
    	country = gets.chomp
    end
    # return the array of students
    students
end


students = input_students
print_header
print(students)
print_footer(students)