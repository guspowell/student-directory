#lets put all the students into an array
students = [
	"Dr. Hannibal Lecter",
	"Darth Vader",
	"Nurse Ratched",
	"Michael Corleone",
   	"Alex De Large",
	"The Alien",
	"Terminator",
    "Freddy Kruger",
    "The Joker"
]
# and then print them
students.each do |student|
	puts student
end
#finally we print the total
print "Overall, we have #{students.length} great students"
#it’s important that print() doesn’t add new line characters