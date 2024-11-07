class SubjectsController < ApplicationController
  before_action :set_subject, only: [:edit, :update, :destroy]

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def edit
    # @subject is set by before_action
  end

  def update
    Rails.logger.debug "Params ID: #{params[:id]}"
    if @subject.update(subject_params)
      redirect_to subjects_path, notice: 'Subject was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to new_note_path, notice: 'Subject was successfully created.'
    else
      render 'new'
    end
  end

  def destroy
    @subject.destroy
    redirect_to subjects_path, notice: 'Subject was successfully deleted.'
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :description)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to subjects_path, alert: 'Subject not found.'
  end
end
