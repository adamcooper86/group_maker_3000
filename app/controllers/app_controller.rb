class Controller
  def initialize
    View.greet
    @cohort = View.get_cohort
    evaluate_cohort
    command_loop
  end
  def evalutate_cohort
    if Cohort.exists? @cohort
      @cohort = Cohort.find_by(:name => @cohort)
    else
      if View.create_new_cohort? == "y"
        @cohort = Cohort.create(:name => @cohort)
        name_array = View.input_name
        name_array.each {|name| Student.create(:name => name, :cohort_id => @cohort.id)}
      else
        @cohort = View.get_cohort
        evalutate_co
      end
    end
  end
  def command_loop
    commands = ["make groups", "get groups", "get cohort information"]
    command = View.get_command
    if command == "make groups"
      View.give_to_user @cohort.make_groups
    elsif command == "get groups"
      View.give_to_user @cohort.this_weeks_groups
    elsif command == "get cohort information"
      View.give_to_user @cohort.cohort_information
    elsif command == "exit"
      return
    else
      View.did_not_understand(command)
    end
    command_loop
  end
end

