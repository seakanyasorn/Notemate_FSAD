class AddRatingToNotes < ActiveRecord::Migration[7.2]
  def change
    add_column :notes, :rating, :integer
  end
end
