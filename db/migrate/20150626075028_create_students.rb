class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.references :group, :index => true
      t.references :cohort, :index => true
    end
  end
end
