class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update destroy]

  def index
    @groups = Group.all.order('name ASC')
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to @group, notice: 'Course was successfully created.'
    else
      render :new, alert: 'Course was not created.'
    end
  end

  def show
    @group = Group.all.find(params[:id])
    @transactions = current_user.transactions
    @groups = current_user.groups
  end

  def edit
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
    @group = current_user.groups.find(params[:id])
  end
end
