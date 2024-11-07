class AddInstitutionToNotes < ActiveRecord::Migration[7.2]
  def change
    add_reference :notes, :institution, null: true, foreign_key: true
  end
end
