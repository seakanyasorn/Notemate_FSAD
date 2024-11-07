class AddSemesterAndYearToNotes < ActiveRecord::Migration[7.2]
  def change
    add_column :notes, :semester, :string
    add_column :notes, :year, :integer
  end
end
