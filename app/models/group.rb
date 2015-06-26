require 'faker'
class Group < ActiveRecord::Base
  has_and_belongs_to_many :students
  belongs_to :cohort

  def self.random_name
    Faker::Team.name
  end
end
