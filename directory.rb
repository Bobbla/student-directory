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

puts "The Students of my cohort at Makers Academy"
puts ("--------------")
students.each do |student|
	puts student
end
#finally, we print the total
puts "Overall, we have #{students.length} great students"
