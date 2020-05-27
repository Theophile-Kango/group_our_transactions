class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all.order('name ASC')
  end

  def new
    user = User.find_by(id: session[:user_id])
    @group = user.groups.new
  end

  def create
    user = User.find_by(id: session[:user_id])
    @group = user.groups.new(group_params)

    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      
      render :new, alert: 'Group was not created.'
    end
  end

  def show
    user = User.find_by(id: session[:user_id])
    @group_trans = user.transactions
  end

  def edit
  end

  def update
    if @group.update(transaction_params)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'Group was successfully destroyed.'
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
