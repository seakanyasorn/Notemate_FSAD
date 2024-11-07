class CreateSubjectRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :subject_requests do |t|
      t.string :name
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
