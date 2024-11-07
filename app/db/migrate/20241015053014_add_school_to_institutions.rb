class AddSchoolToInstitutions < ActiveRecord::Migration[7.2]
  def change
    add_reference :institutions, :school, null: true, foreign_key: true
  end
end
