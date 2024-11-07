class CreateRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :action
      t.string :status, default: "pending" # default status is pending

      t.timestamps
    end
  end
end
