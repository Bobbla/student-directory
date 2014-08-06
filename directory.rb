def input_students
	print "Please enter the names of the students\n"
	print "To finish, just hit return twice\n"
	#create an empty array
	students = []
	#get the first name
	name = gets.chomp
	#while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {:name => name, :cohort => :august}
		print "Now we have #{students.length} students\n"
		# get another name from user
		name = gets.chomp
	end
	#return array of students
	students
end

def print_header
	print "The Students of my cohort at Makers Academy\n--------------\n"
end
#rewrite method to print all students using "while" or "until"
def print_student(studentlist)
	count = 1
		while count <=studentlist.length
			studentlist.select  do |student|
			puts "#{count}. #{student[:name]} (#{student[:cohort]} cohort)\n"
			count = count +1	
		end		
	end
end

# def print_student(students)
# 	students.each.with_index(1) do |student, index|
# 		print "#{index} #{student[:name]} (#{student[:cohort]} cohort)\n"
# 	end
# end

def print_footer(students)
	print "Overall, we have #{students.length} great students\n"
end
#nothing happens until we call the methods
students = input_students
print_header
print_student(students)
print_footer(students)

#modify program to only search for a character called by the user 

def student_select(studentlist)
	puts "What starting letter would you like to search for?"
	character = gets.chomp.capitalize
	studentlist.select do |student|
		puts "#{student[:name]}" if student[:name].start_with?(character)
	end
end

student_select(students)
#calling names with less than 12 characters
def name_length(studentlist)
	puts "These names have less and 12 characters"
	studentlist.select  do |student|
		puts "#{student[:name]}" if student[:name].length < 12
	end
end		

name_length(students) 