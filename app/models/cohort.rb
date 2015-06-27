class Cohort < ActiveRecord::Base
  has_many :students
  has_many :groups

  def create_new_groups
    groups = []
    6.times do
      groups << Group.create(:name => Group.random_name, :cohort_id => self.id)
    end

    self.students.each do |student|
      group_count = 0
      collision_count = 0
      groups[group_count].students.include? student.groups.last.students
        groups[count%6].students << student
      end
    end
  end
end

self.students.each do |student|
  collision_count = []
  groups.each do |group|
    count = 0
    if group.students.id.match?
