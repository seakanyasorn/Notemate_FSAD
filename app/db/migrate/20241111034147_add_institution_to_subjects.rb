class AddInstitutionToSubjects < ActiveRecord::Migration[7.2]
  def change
    add_reference :subjects, :institution, foreign_key: true
  end
end
