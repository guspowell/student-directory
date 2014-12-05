@students = [] # an empty array accessible to all methods

def print_header
	puts "The students of my cohort at Makers Academy".center(100)
	puts "--------------".center(100)
end

def input_students
	puts "please enter the names of the student you wish to add"
	puts "when you are done press enter twice"
	number = 1
	name = gets.chomp

	# while the name is not empty, repeat this code
	while !name.empty? do
    	puts "what cohort is #{name} in?"
    	cohort = gets.chomp
		puts "what is #{name}'s country of origin?"    	
    	country = gets.chomp
    	@students << {:number => number, :name => name, :cohort => cohort, :country => country}
    	if @students.length == 1
    		puts "now we have #{@students.length} great student"
    	else
    		puts "now we have #{@students.length} great students"
    	end
    	# get another name from user
    	puts "please enter another name:"
    	number += 1
    	name = gets.chomp
    end
    # return the array of students
    @students
end

def print_students_list
	@students.each do |student|
		if student[:name].length < 12
			puts "#{student[:number]}. #{student[:name]} (#{student[:cohort]} cohort) is from #{student[:country].capitalize}"
		end
	end
end

def print_footer
	unless @students.length == 1
		puts "overall we have #{@students.length} great students"
		puts "--------------".center(100)
	else
		puts "overall we have #{@students.length} great student"
		puts "--------------".center(100)
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "9. Exit"
end

def show_students
	@students.length == 0 ? exit : print_header
	print_students_list
	print_footer
end

def process(selection)
	case selection
  	when "1"
  		@students = input_students
  	when "2"
  		show_students
  	when "3"
  		save_students
  	when "9"
  		Exit
  	else
  		puts "I don't know what you meant, try again"
  	end
end

def interactive_menu
	loop do
		print_menu
  		process(gets.chomp)
  	end
end

def save_students
	# open the file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:number], student[:name], student[:cohort], student[:country]]
		csv_line = student_data.join (",")
		file.puts csv_line
	end
	file.close
	puts "saved"
end

interactive_menu


