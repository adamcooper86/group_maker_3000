class View

  attr_reader :input_name

  def self.greet
    puts "Welcome to the Pairing Group Randomizer!"
  end

  def self.get_cohort
    puts "Please enter the name of the cohort:  "
    gets.chomp
  end

  def self.create_new_cohort?
    puts "Would you like to create a new cohort? y or n "
    gets.chomp
  end

  def self.input_name
    array_of_student = []
    puts "Please enter student's name one at a time:"
    puts "(enter 'exit' when finished)"
    loop do
     input = gets.chomp
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
    gets.chomp
  end

  def self.give_to_user(args)
    puts args
  end

  def self.did_not_understand(command)
    puts "Sorry, we did not understand #{command}. Please enter a valid command."
  end

end


