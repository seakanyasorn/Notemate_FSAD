class AddReportTypeToReportIssues < ActiveRecord::Migration[7.2]
  def change
    add_column :report_issues, :report_type, :string
  end
end
