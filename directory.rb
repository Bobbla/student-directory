def input_students
	print "Please enter the names of the students\n"
	print "To finish, just hit return twice\n"
	#create an empty array
	students = []
	#get the first name
	print "What is your name?\n"
	name = gets.chomp
	#Which cohort
	print "What cohort are you on?\n"
	cohort = gets.chomp 
	#provided default & corrected spelling
	cohort_months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
				if cohort_months.include?(cohort)
					puts "Cohort verified"
				elsif cohort.empty?
					cohort = "xxx"
					puts "cohort not provided"
				else
				puts "Please re-enter cohort"
				cohort = gets.chomp
			end
	#ask about hobbies
	print "What are your hobbies?\n"
	hobbies = gets.chomp
	#country of birth
	print "What what country where you born in?\n"
	country = gets.chomp
	#height
	print "how tall are you?\n"
	height = gets.chomp 
	#while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {:name => name, :cohort => cohort, :hobbies => hobbies, :country => country, :height => height}
		print "Now we have #{students.length} students\n"
		# get another name from user
		print "What is the next name?\n"
		name = gets.chomp
		if name != ""
			print "What cohort are you on?\n"
			cohort = gets.chomp 
			#provided default & corrected spelling
			if cohort_months.include?(cohort)
					puts "Cohort verified"
				elsif cohort.empty?
					cohort = "xxx"
					puts "cohort not provided"
				else
				puts "Please re-enter cohort"
				cohort = gets.chomp
			end
				#ask about hobbies
			print "What are your hobbies?\n"
			hobbies = gets.chomp
			#country of birth
			print "What what country where you born in?\n"
			country = gets.chomp
			#height
			print "how tall are you?\n"
			height = gets.chomp 
		end
	end
	#return array of students
	students
end
#used method center to make output pretty

def print_header
	header = "The Students of my cohort at Makers Academy\n--------------\n"
	puts header.center(100)
end

#rewrite method to print all students using "while" or "until"

# def print_student(studentlist)
# 	count = 1
# 		while count <=studentlist.length
# 			studentlist.select  do |student|
# 			puts "#{count}. #{student[:name]} (#{student[:cohort]} cohort)\n"
# 			count = count +1	
# 		end		
# 	end
# end

def print_student(studentlist)
	count = 0
	until count >=studentlist.length
		studentlist.select  do |student|
			count = count +1	
			puts "#{count}. #{student[:name]} (#{student[:cohort]} cohort)"
			line2 = "Hobbies: #{student[:hobbies]}, place of Birth: #{student[:country]}, Height: #{student[:height]}\n" 
			puts line2.center(53)		
		end		
	end
end

# def print_student(students)
# 	students.each.with_index(1) do |student, index|
# 		print "#{index} #{student[:name]} (#{student[:cohort]} cohort)\n"
# 	end
# end

	def print_footer(students)
		footer = "Overall, we have #{students.length} great students\n"
		puts footer.center(100)
	end 

#modify program to only search for a character called by the user 

def student_select(studentlist)
	puts "What starting letter would you like to search for?"
	character = gets.chomp.capitalize
	studentlist.select do |student|
		puts "#{student[:name]}" if student[:name].start_with?(character)
	end
end

#calling names with less than 12 characters
def name_length(studentlist)
	puts "These names have less and 12 characters"
	studentlist.select  do |student|
		puts "#{student[:name]}" if student[:name].length < 12
	end
end		
#print students by cohort
def student_cohorts(studentcohorts)
	student_cohorts = (studentcohorts.map {|student| student[:cohort]}).uniq
	# puts student_cohorts
	student_cohorts.each do |cohort|
		puts "#{cohort} cohort:"
		studentcohorts.select do |student|
			puts "#{student[:name]}" if student[:cohort] == cohort
		end
	end	
end

#nothing happens until we call the methods
students = input_students
print_header
print_student(students)
print_footer(students)
student_select(students)
name_length(students) 
student_cohorts(students) 