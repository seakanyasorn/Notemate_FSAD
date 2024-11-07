class Admin::RequestsController < ApplicationController
  before_action :authorize_admin
  before_action :set_request, only: [:approve, :reject]  # Add this line

  def index
    @pending_requests = Request.where(status: "pending")
  end

  def approve
    if @request.request_type == 'subject'
      # Create the subject based on the request details
      subject = Subject.new(name: @request.subject_name)
  
      if subject.save
        @request.update(status: "approved")  # Update the request status
        redirect_to admin_dashboard_path, notice: "Request approved and subject created."
      else
        redirect_to admin_dashboard_path, alert: "Error creating subject. Please try again."
      end
    elsif @request.request_type == 'institution'
      # Create the institution based on the request details
      institution = Institution.new(name: @request.institution_name)
  
      if institution.save
        @request.update(status: "approved")  # Update the request status
        redirect_to admin_dashboard_path, notice: "Request approved and institution created."
      else
        redirect_to admin_dashboard_path, alert: "Error creating institution. Please try again."
      end
    else
      redirect_to admin_dashboard_path, alert: "Unknown request type."
    end
  end
  

  def reject
    @request.update(status: "rejected")
    redirect_to admin_dashboard_path, notice: "Request rejected."
  end


  private

  def set_request
    @request = Request.find(params[:id])  # Set the @request instance variable
  rescue ActiveRecord::RecordNotFound
    redirect_to admin_requests_path, alert: "Request not found."  # Handle request not found
  end

  def authorize_admin
    redirect_to root_path, alert: "Not authorized" unless current_user.admin?
  end
end
