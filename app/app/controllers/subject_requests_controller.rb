class SubjectRequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @subject_request = SubjectRequest.new
  end

  def create
    @subject_request = SubjectRequest.new(subject_request_params)
    @subject_request.user = current_user
    @subject_request.status = "pending"  # Set initial status

    if @subject_request.save
      redirect_to subjects_path, notice: "Your request for a new subject has been submitted and is awaiting approval."
    else
      render :new
    end
  end

  private

  def subject_request_params
    params.require(:subject_request).permit(:name)
  end
end
