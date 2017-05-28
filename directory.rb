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
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} #{@students.count == 1 ? "student" : "students"}"
    name = STDIN.gets.chomp
  end
  puts "Students added successfully"
  puts "-------------"
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
  file = File.open(@filename, "w")
  @students.each do |student|
    student_data = [student[:name]], student[:cohort]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "List saved to #{@filename}"
  puts "-------------"
end

def load_students
  file = File.open(@filename,"r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
file.close
puts "List loaded from file"
puts "-------------"
end

def try_load_students
  unless ARGV.first.nil?
    @filename = ARGV.first
  end
  if File.exists?(@filename)
    load_students
    puts "Loaded #{@students.count} from #{@filename}"
  else
    puts "Sorry, #{@filename} doesn't exist"
    exit
  end
end

try_load_students
interactive_menu
