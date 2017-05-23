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
    students.each_with_index do |student, index|
        if student[:name].length < 12
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
        else
          puts ""
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
