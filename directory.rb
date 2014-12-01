def print_header
	puts "The students of my cohort at Makers Academy"
	puts "--------------"
end

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "overall we have #{names.length} great students"
end

def input_students
	puts "please enter the names of the students"
	puts "when you are done press enter twice"
	students = []
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
    	# add the student hash to the array
    	students << {:name => name, :cohort => :november}
    	puts "now we have #{students.length} great students"
    	# get another name from user
    	name = gets.chomp
    end
    # return the array of students
    students
end


students = input_students
print_header
print(students)
print_footer(students)