class PagesController < ApplicationController
  def profile
    @user = User.find_by(id: session[:user_id])
  end
end
