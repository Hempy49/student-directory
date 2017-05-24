def interactive_menu
  students = []
  loop do
    #1.print menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #2. read the input and save it into a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
    when "1"
      #input students
      students = input_students
    when "2"
      #show students
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
    #4. repeat from step1

  end
end

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
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  count = students.count
  puts "Overall, we have #{count} great #{count == 1 ? "student" : "students"}"
end

interactive_menu
