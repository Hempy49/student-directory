def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} #{students.count == 1 ? "student" : "students"}"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
puts "Enter the starting letter of students you wish to display:"
    puts "Hit enter twice to display all students"
    letter = gets.chomp

    students.each_with_index do |student, index|
        if student[:name][0].downcase == letter.downcase
            puts "#{student[:name]} (#{student[:cohort]} cohort)"
        elsif letter == ""
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
        end
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
