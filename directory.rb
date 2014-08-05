student_count = 6

#let's put all students into an array
students = [
"Javier Silverio",
"Elliot Lewis",
"Ben Tillett",
"Vincent Koch",
"Michelle Ballard",
"Nick Roberts",
"Emma Feeney"
]

def print_header
	puts "The Students of my cohort at Makers Academy"
	puts ("--------------")
end

def print(students)
	students.each do |student|
		puts student
	end
end

def print_footer(students)
	puts "Overall, we have #{students.length} great students"
end
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)


