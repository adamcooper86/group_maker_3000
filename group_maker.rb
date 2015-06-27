require_relative 'config/application'
require_relative 'lib/import'

unless ARGV.empty?
  import_text_file(ARGV[0])
end

# Controller.new

cohort = Cohort.find_or_create_by(:name => 'Grasshoppers')
30.times do
  cohort.students << Student.create(:name => "stupidface")
end
cohort.create_new_groups


puts "##############################"
puts "cohort"
p cohort
puts "##############################"
puts "cohort students"
p cohort.students
puts "#############c#################"
puts "cohort groups"
p cohort.groups
puts "##############################"
puts "group students"
cohort.groups.last(6).each do |group|
  p group.students
end
