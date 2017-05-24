def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return"
  students = []
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  name = gets.delete! "\n"

  while !name.empty? do
    puts "Now enter their cohort:"
    cohort = gets.delete! "\n"
    if !months.include? cohort
      puts "Cohort not found. Options are #{months}"
    else
      students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} #{students.count == 1 ? "student" : "students"}"
      puts "Please enter next students name"
      puts "To finish, just hit return"
      name = gets.chomp
    end
  end
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
    if !students.empty?
    print_header
    students.each do |student|
    puts "#{student[:name]}, (#{student[:cohort]} cohort)"
  end
  if students.empty?
    puts ""
    end
    print_footer(students)
  end
end

def print_footer(students)
  count = students.count
  puts "Overall, we have #{count} great #{count == 1 ? "student" : "students"}"
end

students = input_students
print(students)
