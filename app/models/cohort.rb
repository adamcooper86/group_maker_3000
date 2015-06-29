class Cohort < ActiveRecord::Base
  has_many :students
  has_many :groups

  def make_groups
    number_of_groups = find_number_of_groups
    group_array = []
    number_of_groups.times do
      group_array << Group.create(:name => Group.random_name, :cohort_id => self.id)
    end

    count = 0
    self.students.each do |student|
      unless student.groups.empty?
        inner_count = 0
        while true
          if (student.groups.map{|group| group.students.to_a}.flatten & group_array[count%number_of_groups].students.to_a).length <= inner_count/number_of_groups
            group_array[count%number_of_groups].students << student
            count += 1
            break
          end
          count += 1
          inner_count += 1
        end
      else
        group_array[count%number_of_groups].students << student
        count += 1
      end
    end
    odd_groups = group_array.find_all do |group|
      group.students.length.odd?
    end
    unless odd_groups.empty?
      if odd_groups.length == 6
        student_one = odd_groups[3].students.sample
        student_two = odd_groups[4].students.sample
        student_three = odd_groups[5].students.sample

        odd_groups[0].students << student_one
        odd_groups[1].students << student_two
        odd_groups[2].students << student_three

        odd_groups[3].students.delete(student_one)
        odd_groups[4].students.delete(student_two)
        odd_groups[5].students.delete(student_three)
      elsif odd_groups.length >=4
        student_one = odd_groups[2].students.sample
        student_two = odd_groups[3].students.sample

        odd_groups[0].students << student_one
        odd_groups[1].students << student_two

        odd_groups[2].students.delete(student_one)
        odd_groups[3].students.delete(student_two)
      elsif odd_groups.length >=2
        student_one = odd_groups[1].students.sample

        odd_groups[0].students << student_one

        odd_groups[1].students.delete(student_one)
      end
    end
    group_array
  end

  def find_number_of_groups
    number_of_students = self.students.length
    if number_of_students <= 19
      4
    elsif number_of_students < 24
      5
    else
      6
    end
  end

  def get_groups
    self.groups.last(find_number_of_groups)
  end
end

