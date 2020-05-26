class UsersController < ApplicationController
  include SessionsHelper
  before_action :set_user, only: [:edit, :update]
  before_action :logged_in?, only: %i[create new]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = "Account created succesfully welcome #{@user.name}"
      log_in @user
      redirect_to profile_path
    else
      flash.now[:notice] = 'Please enter your name'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: 'User was successfully updated.'
    else
      render :edit 
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end

  def set_user
    @user = User.find_by(id: session[:user_id])
  end
end
