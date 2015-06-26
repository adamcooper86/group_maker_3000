class CreateGroupsAndStudents < ActiveRecord::Migration
  def change
    create_table :groups_students, id: false do |t|
      t.belongs_to :group, index: true
      t.belongs_to :student, index: true
    end
  end
end
