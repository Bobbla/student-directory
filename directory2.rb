
def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	students = []

	name = gets.chomp

	while !name.empty? do
		students << {:name => name, :cohort => :november}
		puts "Now we have #{students.length} students"
		name = gets.chomp
	end
students
end

def puts_header
puts "The students of my cohort at Makers Academy"
puts "------------"
end

def print(names)
names.each do |student|
	puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def puts_footer(names)
puts "Overall, we have #{names.length} great students"
end

students = input_students
puts_header
puts(students)
puts_footer(students)

