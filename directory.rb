student_count = 6

#let's put all students into an array
students = [
	{:name=> "Javier Silverio", :cohort => :august},
	{:name=> "Elliot Lewis", :cohort=> :august},
	{:name=> "Ben Tillett", :cohort=> :august},
	{:name=> "Vincent Koch", :cohort=> :august},
	{:name=> "Michelle Ballard", :cohort=> :august},
	{:name=> "Nick Roberts", :cohort=> :august},
	{:name=> "Emma Feeney", :cohort => :august}
]

def print_header
	puts "The Students of my cohort at Makers Academy"
	puts ("--------------")
end

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(students)
	puts "Overall, we have #{students.length} great students"
end
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)


