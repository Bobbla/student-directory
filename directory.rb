	@students = []

def input_students
	print "Please enter the names of the students\n"
	print "To finish, just hit return twice\n"
	#create an empty array
	#get the first name
	print "What is your name?\n"
	name = STDIN.gets.strip
	#Which cohort
	print "What cohort are you on?\n"
	cohort = STDIN.gets.strip 
	#provided default & corrected spelling
	cohort_months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
				if cohort_months.include?(cohort)
					puts "Cohort verified"
				elsif cohort.empty?
					cohort = "xxx"
					puts "cohort not provided"
				else
				puts "Please re-enter cohort"
				cohort = STDIN.gets.strip
			end
	#ask about hobbies
	print "What are your hobbies?\n"
	hobbies = STDIN.gets.strip
	#country of birth
	print "What what country where you born in?\n"
	country = STDIN.gets.strip
	#height
	print "how tall are you?\n"
	height = STDIN.gets.strip 
	#while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		@students << {:name => name, :cohort => cohort, :hobbies => hobbies, :country => country, :height => height}
		#changed the pluralisation
		print "Now we have #{@students.length} great student"
		if @students.length != 1
			print "s"
		end
		print "\n"
		# get another name from user
		print "What is the next name?\n"
		name = STDIN.gets.strip
		if name != ""
			print "What cohort are you on?\n"
			cohort = STDIN.gets.strip 
			#provided default & corrected spelling
			if cohort_months.include?(cohort)
					puts "Cohort verified"
				elsif cohort.empty?
					cohort = "xxx"
					puts "cohort not provided"
				else
				puts "Please re-enter cohort"
				cohort = STDIN.gets.strip
			end
				#ask about hobbies
			print "What are your hobbies?\n"
			hobbies = STDIN.gets.strip
			#country of birth
			print "What what country where you born in?\n"
			country = STDIN.gets.strip
			#height
			print "how tall are you?\n"
			height = STDIN.gets.strip 
		end
	end
	#return array of students
	@students
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

def print_students_list
	count = 0
	until count >=@students.length
		@students.select  do |student|
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

	def print_footer
		footer = "Overall, we have #{@students.length} great students\n"
		puts footer.center(100)
	end 

#modify program to only search for a character called by the user 

# def student_select(studentlist)
# 	puts "What starting letter would you like to search for?"
# 	character = gets.strip.capitalize
# 	studentlist.select do |student|
# 		puts "#{student[:name]}" if student[:name].start_with?(character)
# 	end
# end

# #calling names with less than 12 characters
# def name_length(studentlist)
# 	puts "These names have less and 12 characters"
# 	studentlist.select  do |student|
# 		puts "#{student[:name]}" if student[:name].length < 12
# 	end
# end		
# #print students by cohort
# def student_cohorts(studentcohorts)
# 	student_cohorts = (studentcohorts.map {|student| student[:cohort]}).uniq
# 	# puts student_cohorts
# 	student_cohorts.each do |cohort|
# 		puts "#{cohort} cohort:"
# 		studentcohorts.select do |student|
# 			puts "#{student[:name]}" if student[:cohort] == cohort
# 		end
# 	end	
# end
# #created 'no students in list' output
# def show_students
# 	if @students.length <= 0
# 		puts "no students in list"
# 	else
# 		print_header
# 		print_student(students)
# 		print_footer(students)
# 		student_select(students)
# 		name_length(students) 
# 		student_cohorts(students) 
# 	end	
# end

#redacted interactive_menu code
@students = [] #an empty array accessable to all methods

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
	print_header
	print_students_list
	print_footer
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
#able to load the students from the csv file (but not show them)
def load_students(filename = "students.csv")
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(',')
		@students << {:name => name, :cohort => cohort.to_sym}
	end
	file.close
end

def try_load_students
	filename = ARGV.first # first argument from the command line
	return if filename.nil? # get out of the methog if it isn't given
	if File.exists?(filename) # if it exists
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else # if it doesn't exist
		puts "Sorry, #{filename} doesn't exist."
		exit # quit the program
	end
end	

def process(selection)
	case selection
		when "1" 
			input_students
		when "2"
			show_students
		when "3"
      		save_students
      	when "4"
      		load_students
		when "9"
			exit	#this will cause the program to terminatw
		else
			puts "I don't know what you mean, try again"
	end
end	

def interactive_menu
	loop do 
		print_menu
		process(STDIN.gets.chomp)
	end
end

try_load_students
interactive_menu

# nothing happens until we call the methods
# hashed out the below as menu supercedes it
# students = input_students
# show_students(students)

# def interactive_menu
# 	students = []
# 	loop do
# 	#1. print the menu and ask the user what to do
# 	puts "1. Input the students"
# 	puts "2. Show the students"
# 	puts "9. Exit" # 9 because we'll be adding more items
# 	#2. read the input and save it to a variable
# 	selection = gets.chomp
# 	#3. do what the user has asked
# 	case selection
# 		when "1" 
# 			students = input_students
# 		when "2"
# 			print_header
# 			print_student(students)
# 			print_footer(students)
# 		when "9"
# 			exit	#this will cause the program to terminatw
# 		else
# 			puts "I don't know what you mean, try again"
# 		end
# 	end
# end	

# interactive_menu


