module Admin
  class ReportsController < ApplicationController
    before_action :set_report, only: [:resolve, :destroy, :delete_note]

    def resolve
      if @report.update(status: 'resolved')
        redirect_to admin_dashboard_path, notice: "Report marked as resolved."
      else
        redirect_to admin_dashboard_path, alert: "Failed to resolve the report."
      end
    end

    # Method to delete the note associated with the report
    def delete_note
      if @report.note.destroy # Assuming a note is associated with the report
        redirect_to admin_dashboard_path, notice: "Note deleted successfully."
      else
        redirect_to admin_dashboard_path, alert: "Failed to delete the note."
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

    def set_report
      @report = ReportIssue.find(params[:id]) # Adjust according to your model
    end
  end
end
