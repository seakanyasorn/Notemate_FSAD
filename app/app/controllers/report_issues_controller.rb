class ReportIssuesController < ApplicationController
  before_action :authenticate_user!  # Require login for reporting issues

  def new
    @report_issue = ReportIssue.new
    @notes = Note.all # Load all notes or filter based on your criteria
  end

  def create
    @report_issue = current_user.report_issues.build(report_issue_params)
    @notes = Note.all # Ensure @notes is available if re-rendering the form

    # Validate presence of note_id if report_type is 'inappropriate_note'
    if @report_issue.report_type == 'inappropriate_note' && @report_issue.note_id.blank?
      @report_issue.errors.add(:note_id, "must be selected for inappropriate notes")
      render :new
      return
    end

    if @report_issue.save
      redirect_to root_path, notice: "Thank you for reporting the issue. We'll review it soon."
    else
      render :new, alert: "Unable to submit your report. Please try again."
    end
  end  

  private

  def report_issue_params
    params.require(:report_issue).permit(:description, :report_type, :note_id)
  end
end
