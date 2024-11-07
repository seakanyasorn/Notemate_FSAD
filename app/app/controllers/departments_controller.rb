class DepartmentsController < ApplicationController
  def index
    if params[:school_id].present?
      @departments = Department.where(school_id: params[:school_id])
      respond_to do |format|
        format.json { render json: @departments }
      end
    else
      @departments = Department.all
    end
  end

  def show
    @department = Department.find(params[:id])
  end

  def new
    @department = Department.new
    @schools = School.all
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path, notice: 'Department was successfully created.'
    else
      render :new
    end
  end

  def departments_for_school
    @departments = Department.where(school_id: params[:school_id])
    respond_to do |format|
      format.json { render json: @departments }
    end
  end

  private

  def department_params
    params.require(:department).permit(:name, :school_id)
  end
end
