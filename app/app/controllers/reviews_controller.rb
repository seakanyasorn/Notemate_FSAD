class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    # @subjects = Subject.includes(:reviews).all
    # @reviews = Review.all
    # def index
    # Fetching the filters from the form
    @subject_id = params[:subject_id]
    @user_id = params[:user_id]
    @institution_id = params[:institution_id]
    @semester = params[:semester]
    @school_id = params[:school_id]
    @department_id = params[:department_id]
    @year = params[:year]

    # Applying filters if they exist
    @reviews = Review.all

    @reviews = @reviews.where(subject_id: @subject_id) if @subject_id.present?
    @reviews = @reviews.where(user_id: @user_id) if @user_id.present?
    @reviews = @reviews.where(institution_id: @institution_id) if @institution_id.present?
    @reviews = @reviews.where(semester: @semester) if @semester.present?
    @reviews = @reviews.where(school_id: @school_id) if @school_id.present?
    @reviews = @reviews.where(department_id: @department_id) if @department_id.present?
    @reviews = @reviews.where(year: @year) if @year.present?

  
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @subjects = Subject.all
    @institutions = Institution.all
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to reviews_path, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :reviewer, :subject_id)
  end
end
