class AddDepartmentToSubjects < ActiveRecord::Migration[7.2]
  def change
    add_reference :subjects, :department, null: true, foreign_key: true
  end
end
