def import_text_file file_name
  count = 0
  cohort = 0
  File.open(file_name).each do |line|
    unless line.include? "###"
      if count == 0
        return if Cohort.find_by(:name => line.chomp)

        cohort = Cohort.find_or_create_by(:name => line.chomp)
      else
        cohort.students.create(:name => line.chomp)
      end
      count += 1
    end
  end
end
