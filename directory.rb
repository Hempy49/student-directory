@students = []
@filename = "students.csv"

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
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
    puts "Program exited"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  name = student_name
  while !name.empty? do
    make_array(name, "november")
    puts "Now we have #{@students.count} #{@students.count == 1 ? "student" : "students"}"
    name = student_name
  end
  puts "Students added successfully"
  puts "-------------"
end

def student_name
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list()
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  count = @students.count
  puts "Overall, we have #{count} great #{count == 1 ? "student" : "students"}"
  puts "-------------"
end


def save_students
  File.open(@filename, "w") do |f|
  @students.each do |student|
    student_data = [student[:name]], student[:cohort]
    csv_line = student_data.join(",")
    f.puts csv_line
  end
end
  puts "List saved to #{@filename}"
  puts "-------------"
end

def load_students
  File.open(@filename,"r") do |f|
  f.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    make_array(name, cohort)
  end
end
puts "List loaded from file"
puts "-------------"
end

def try_load_students
    filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{@filename}"
  else
    puts "Sorry, #{@filename} doesn't exist"
    exit
  end
end

def make_array(name, cohort)
 @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
