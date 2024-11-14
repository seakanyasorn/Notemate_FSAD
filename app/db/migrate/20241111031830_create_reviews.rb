class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.references :subject, null: false, foreign_key: true
      t.text :content
      t.integer :rating
      t.string :reviewer

      t.timestamps
    end
  end
end
