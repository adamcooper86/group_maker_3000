require_relative 'config/application'
require_relative 'lib/import'

unless ARGV.empty?
  import_text_file(ARGV[0])
end

# Controller.new

cohort = Cohort.create(:name => 'Bumbles')
group = Group.create(:name => 'Bees')

cohort.groups << group

ap = Student.create(:name => 'Andrew Pats')

group.students << ap

p cohort
p cohort.groups
p group.students




