def print_header
	puts "The students of my cohort at Makers Academy".center(100)
	puts "--------------".center(100)
end

def input_students
	puts "please enter the names of the student you wish to add"
	puts "when you are done press enter twice"
	students = []
	number = 1
	name = gets.chomp

	# while the name is not empty, repeat this code
	while !name.empty? do
    	puts "what cohort is #{name} in?"
    	cohort = gets.chomp
		puts "what is #{name}'s country of origin?"    	
    	country = gets.chomp
    	students << {:number => number, :name => name, :cohort => cohort, :country => country}
    	if students.length == 1
    		puts "now we have #{students.length} great student"
    	else
    		puts "now we have #{students.length} great students"
    	end
    	# get another name from user
    	puts "please enter another name:"
    	number += 1
    	name = gets.chomp
    end
    # return the array of students
    students
end

def print(students)
	students.each do |student|
		if student[:name].length < 12
			puts "#{student[:number]}. #{student[:name]} (#{student[:cohort]} cohort) is from #{student[:country].capitalize}"
		end
	end
end

def print_footer(names)
	unless names.length == 1
		puts "overall we have #{names.length} great students"
	else
		puts "overall we have #{names.length} great student"
	end
end


students = input_students
students.length == 0 ? exit : print_header
print(students)
print_footer(students)

