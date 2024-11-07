class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    @departments = @school.departments
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to schools_path, notice: 'School was successfully created.'
    else
      render :new
    end
  end

  def departments
    @departments = Department.where(school_id: params[:school_id])
    render json: @departments
  end

  private

  def school_params
    params.require(:school).permit(:name)
  end
end
