def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Now enter their height:"
    height = gets.chomp
    puts "Enter their date of birth (dd/mm/yy):"
    d_o_b = gets.chomp
    students << {name: name, height: height, d_o_b: d_o_b, cohort: :november}
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
    students.each_with_index do |student, index|
            puts "#{index + 1}. #{student[:name]}, #{student[:height]}, #{student[:d_o_b]} (#{student[:cohort]} cohort)"
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
