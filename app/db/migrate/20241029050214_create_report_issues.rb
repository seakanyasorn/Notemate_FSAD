class CreateReportIssues < ActiveRecord::Migration[7.2]
  def change
    create_table :report_issues do |t|
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
