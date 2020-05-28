class PagesController < ApplicationController
  def index
  end
  
  def profile
    @user = User.find_by(id: session[:user_id])
    @groups = Group.all
  end
end
