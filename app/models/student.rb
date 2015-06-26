class Student < ActiveRecord::Base
  belongs_to :cohort
  has_and_belongs_to_many :groups
end
