class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, except: [:new, :create] # Ensure users are authenticated for certain actions
  before_action :authorize_admin!, only: [:create] # Only allow admin to create users

  def index
    @users = User.all
  end

  def show
    Rails.logger.debug("Params: #{params.inspect}")
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin) # Permit admin attribute
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_admin!
    redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user.admin?
  end
end
