class Admin::ReportsController < ApplicationController
  before_action :set_report, only: [:resolve, :delete_note, :delete_review, :destroy]

  def resolve
    if @report.update(status: 'resolved')
      redirect_to admin_dashboard_path, notice: "Report marked as resolved."
    else
      redirect_to admin_dashboard_path, alert: "Failed to resolve the report."
    end
  end

  # Method to delete the note associated with the report
  def delete_note
    if @report.note && @report.note.destroy # Ensure note exists before destroying
      redirect_to admin_dashboard_path, notice: "Note deleted successfully."
    else
      redirect_to admin_dashboard_path, alert: "Failed to delete the note or the note doesn't exist."
    end
  end

  # Method to delete the review associated with the report
  def delete_review
    if @report.review && @report.review.destroy # Ensure review exists before destroying
      redirect_to admin_dashboard_path, notice: "Review deleted successfully."
    else
      redirect_to admin_dashboard_path, alert: "Failed to delete the review or the review doesn't exist."
    end
  end

  # Method to delete the report itself
  def destroy
    if @report.destroy
      redirect_to admin_dashboard_path, notice: "Report deleted successfully."
    else
      redirect_to admin_dashboard_path, alert: "Failed to delete the report."
    end
  end

  private

  # Find the report by ID to be used in actions
  def set_report
    @report = ReportIssue.find(params[:id]) # Adjust according to your model
  end
end
