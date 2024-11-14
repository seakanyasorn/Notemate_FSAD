class AddReviewIdToReportIssues < ActiveRecord::Migration[7.2]
  def change
    add_column :report_issues, :review_id, :integer
  end
end
