@students = [] # an empty array accessible to all methods

def add_to_array(number, name, cohort, country)
	@students << {:number => number, :name => name, :cohort => cohort, :country => country}
end

def print_header
	puts "The students of my cohort at Makers Academy".center(100)
	puts "--------------".center(100)
end

def input_students
	puts "please enter the names of the student you wish to add"
	puts "when you are done press enter twice"
	number = @students.length + 1
	name = STDIN.gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
    	puts "what cohort is #{name} in?"
    	cohort = STDIN.gets.chomp
		puts "what is #{name}'s country of origin?"    	
    	country = STDIN.gets.chomp
    	add_to_array(number, name, cohort, country)
    	if @students.length == 1
    		puts "now we have #{@students.length} great student"
    	else
    		puts "now we have #{@students.length} great students"
    	end
    	# get another name from user
    	puts "please enter another name:"
    	number += 1
    	name = STDIN.gets.chomp
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
	puts "4. Load students from students.csv"
	puts "5. Check source code"
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
  	when "4"
  		load_students
  	when "5"
  		source_code
  	when "9"
  		exit
  	else
  		puts "I don't know what you meant, try again"
  	end
end

def interactive_menu
	loop do
		print_menu
  		process(STDIN.gets.chomp)
  	end
end

def csv_file_list # in current directory
	csv_files = Dir.entries(".")
	csv_files.select! { |file| file.include?("csv") }
	puts csv_files
end

def select_csv_file # from current directory
	puts "what file would you like to select:"
	csv_file_list
	filename = gets.chomp
end

def save_students
	File.open("students.csv", "w") do |file|
		@students.each do |student|
			student_data = [student[:number], student[:name], student[:cohort], student[:country]]
			csv_line = student_data.join (",")
			file.puts csv_line
		end
	end
	puts "saved"
end

def load_students(filename = "students.csv")
	require 'csv'
	CSV.foreach(filename) do |line|
		number, name, cohort, country = line
		add_to_array(number, name, cohort, country)
	end
	puts " #{filename} has been loaded"
end

def try_load_students
	filename = ARGV.first #first argument from the command
	return if filename.nil? #get out of the method if filename isn't given
	if File.exists?(filename)
		load_students(filename)
		puts "loaded #{@students.length} from #{filename}"
	else # if it doesn't exist
		puts "sorry #{filename} doesn't exist"
		exit # quit program
	end
end

def source_code
	puts $0 # or can use __FILE__
end

try_load_students
interactive_menu


