class Cohort < ActiveRecord::Base
  has_many :students
  has_many :groups

  # def create_new_groups
  #   groups = {}
  #   6.times do
  #     groups << Group.create(:name => Group.random_name, :cohort_id => self.id)
  #   end
  #   self.students.each do |student|
  #     student[:group_id] = groups.sample.id
  #     student.save
  #   end
  # end
end
