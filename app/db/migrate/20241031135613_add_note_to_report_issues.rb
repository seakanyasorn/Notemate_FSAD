class AddNoteToReportIssues < ActiveRecord::Migration[7.2]
  def change
    add_reference :report_issues, :note, null: false, foreign_key: true
  end
end
