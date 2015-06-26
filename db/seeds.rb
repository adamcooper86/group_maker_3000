bees = Cohort.create(:name => "Bumble Bees")
sillies = Cohort.create(:name => "Silly Name")

Group.create(:name => "terrdbyctle", :cohort_id => bees.id)
Group.create(:name => "Velassa-Raker", :cohort_id => bees.id)

name = "a"
25.times do
  bees.students << Student.create(:name => name)
  name = name.next
end
