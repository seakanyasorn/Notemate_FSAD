class AddStatusToReports < ActiveRecord::Migration[7.2]
  def change
    add_column :report_issues, :status, :string
  end
end
