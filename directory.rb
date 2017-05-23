def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} #{students.count == 1 ? "student" : "students"}"
    puts "Please enter next students name"
    puts "To finish, just hit return"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  while count < students.count
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
    #note: [count] retrieves the value of local variable 'count' as a string. 
    count = count + 1
  end
end

def print_footer(students)
  count = students.count
  puts "Overall, we have #{count} great #{count == 1 ? "student" : "students"}"
end

students = input_students
print_header
print(students)
print_footer(students)
