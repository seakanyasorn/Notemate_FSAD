class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_request, only: [:approve, :reject]

  def new
    @request = Request.new
    @subject = Subject.new # Initialize a new subject object for admin form
    @institution = Institution.new # Initialize a new subject object for admin form
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @request.status = "pending"

    # Check if the subject name is empty
    if @request.request_type == 'subject' && @request.subject_name.blank?
      flash[:alert] = "Subject name cannot be empty. Please enter a subject name."
      @request.errors.add(:subject_name, "cannot be empty.")
      # @subject = Subject.new # Initialize a new subject object
      # render 'subjects/new' and return
    end

    # Check if the subject already exists
    if @request.request_type == 'subject' && Subject.exists?(name: @request.subject_name)
      flash[:alert] = "Subject already exists. Please request a different subject."
      @request.errors.add(:subject_name, "already exists. Please request a different subject.")
      # @subject = Subject.new # Initialize a new subject object
      # render 'subjects/new' and return
    end

    if @request.errors.any? and @request.request_type == 'subject'
      # If there are errors, render the subjects/new.html.erb view
      @subject = Subject.new # Initialize a new subject object for rendering
      render 'subjects/new' and return
    end

    if @request.request_type == 'institution' && @request.institution_name.blank?
      flash[:alert] = "Institution name cannot be empty. Please enter a institution name."
      @request.errors.add(:institution_name, "cannot be empty.")
      # @subject = Subject.new # Initialize a new subject object
      # render 'subjects/new' and return
    end

    # Check if the subject already exists
    if @request.request_type == 'institution' && Institution.exists?(name: @request.institution_name)
      flash[:alert] = "Institution already exists. Please request a different institution."
      @request.errors.add(:institution_name, "already exists. Please request a different institution.")
      # @subject = Subject.new # Initialize a new subject object
      # render 'subjects/new' and return
    end

    if @request.errors.any? and @request.request_type == 'institution'
      # If there are errors, render the subjects/new.html.erb view
      @institution = Institution.new # Initialize a new subject object for rendering
      render 'institutions/new' and return
    end

    # Set subject_name based on request_type
    if @request.request_type == 'subject' 
      @request.subject_name = @request.subject_name if @request.subject_name.present?
    elsif @request.request_type == 'institution'
      @request.institution_name = @request.institution_name if @request.institution_name.present?
      # Handle institution logic if needed
      # You can add similar validation logic for institution requests here
    end

    if @request.save
      redirect_to notes_path, notice: "Request submitted successfully."  # Redirect to notes index
    else
      flash[:alert] = "Error submitting request. Please try again."
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:subject_name, :institution_name, :request_type) # Permit necessary fields
  end
end
