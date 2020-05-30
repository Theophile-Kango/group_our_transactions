class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update destroy]

  def index
    @groups = Group.all.order('name ASC')
  end

  def new
    @user = User.find_by(id: session[:user_id])
    @group = @user.groups.new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @group = @user.groups.new(group_params)

    if @group.save
      redirect_to @group, notice: 'Course was successfully created.'
    else
      render :new, alert: 'Course was not created.'
    end
  end

  def show
    @group = Group.all.find(params[:id])
    @user = User.find_by(id: session[:user_id])
    user = User.find_by(id: session[:user_id])
    @transactions = user.transactions
    @group_trans = @user.transactions
    @groups = @user.groups
    @group_list = Group.all
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Course was successfully destroyed.'
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def set_group
    user = User.find_by(id: session[:user_id])
    @group = user.groups.find(params[:id])
  end
end
