# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < ApplicationController
  before_action :authorize_admin!

  def index
    @pending_requests = Request.where(status: "pending") # Modify this line if you have other data to display
    @user_reports = ReportIssue.all # Load all user reports
  end

  # def resolve_admin_report
  #   report = ReportIssue.find(params[:id])
  #   report.update(status: 'resolved') # Assuming you have a `status` field on `ReportIssue`
  #   redirect_to admin_dashboard_index_path, notice: 'Report marked as resolved.'
  # end
  
  # def delete_admin_report
  #   report = ReportIssue.find(params[:id])
  #   report.destroy
  #   redirect_to admin_dashboard_index_path, notice: 'Report deleted successfully.'
  # end
  

  private

  def authorize_admin!
    redirect_to root_path, alert: 'Access denied!' unless current_user&.admin?
  end
end
