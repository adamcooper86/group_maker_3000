class View

  attr_reader :input_name

  def self.greet
    puts "Welcome to the Pairing Group Randomizer!"
  end

  def self.get_cohort
    puts "Please enter the name of the cohort:  "
    STDIN.gets.chomp
  end

  def self.create_new_cohort?
    puts "Would you like to create a new cohort? y or n "
    STDIN.gets.chomp
  end

  def self.input_name
    array_of_student = []
    puts "Please enter student's name one at a time:"
    puts "(enter 'exit' when finished)"
    loop do
     input = STDIN.gets.chomp
      if input == 'exit'
        break
      else
        array_of_student << input
      end
    end
    array_of_student
  end

  def self.get_command
    puts "Would you like to 'make groups', 'get groups', 'get cohort information', or 'exit'?"
    STDIN.gets.chomp
  end

  def self.display_groups(groups)
    groups.each do |group|
      puts "#" * 30
      puts group.name
      puts "-" * 30
      group.students.each do |student|
        puts student.name
      end
    end
  end

  def self.display_cohort_information cohort
    puts "#" * 30
    puts cohort.name
    puts "-" * 30
    puts "There are #{cohort.students.length} students in the cohort."
    puts "-" * 30
    puts "Students:"
    cohort.students.each do |student|
      puts student.name
    end
  end

  def self.did_not_understand(command)
    puts "Sorry, we did not understand #{command}. Please enter a valid command."
  end

end


