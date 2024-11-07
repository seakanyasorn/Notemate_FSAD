class NotesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @notes = Note.all

     @notes = @notes.where(subject_id: params[:subject_id]) if params[:subject_id].present?
    @notes = @notes.where(user_id: params[:user_id]) if params[:user_id].present?
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
    @subjects = Subject.all
    @institutions = Institution.all
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user

    if params[:note][:file].present?
      @note.save_file_with_semester_and_year(params[:note][:file])
    end

    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
    else
      flash.now[:alert] = @note.errors.full_messages.to_sentence # Capture error messages
      render :new
    end
  end

  def search
    @notes = Note.all

    # Filter logic
    @notes = @notes.where(subject_id: params[:subject_id]) if params[:subject_id].present?
    @notes = @notes.where(user_id: params[:user_id]) if params[:user_id].present?
    @notes = @notes.where(institution_id: params[:institution_id]) if params[:institution_id].present?
    @notes = @notes.where(school_id: params[:school_id]) if params[:school_id].present?
    @notes = @notes.where(department_id: params[:department_id]) if params[:department_id].present?
    @notes = @notes.where(semester: params[:semester]) if params[:semester].present?
    @notes = @notes.where(year: params[:year]) if params[:year].present?

    # Feedback message
    @results_count = @notes.count
    flash.now[:notice] = "#{@results_count} note(s) found." if @results_count > 0
    flash.now[:alert] = "No notes found." if @results_count == 0

    # Render the search results
    render :index
  end

  private
  def note_params
    params.require(:note).permit(:title, :content, :subject_id, :institution_id, :semester, :year, :rating)
  end
  
end