class InstitutionsController < ApplicationController
  def index
    @institutions = Institution.all
  end

  def new
    @institution = Institution.new
  end

  def show
    @institution = Institution.find(params[:id])
  end

  def edit
    @institution = Institution.find(params[:id])
  end

  def create
    @institution = Institution.new(institution_params)
    if @institution.save
      redirect_to institutions_path, notice: 'Institution was successfully created.'
    else
      render :new
    end
  end

  private

  def institution_params
    params.require(:institution).permit(:name)
  end
end
