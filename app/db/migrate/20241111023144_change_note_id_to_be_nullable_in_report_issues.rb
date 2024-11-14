class ChangeNoteIdToBeNullableInReportIssues < ActiveRecord::Migration[7.2]
  def change
    change_column_null :report_issues, :note_id, true
  end
end
