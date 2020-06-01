class PagesController < ApplicationController
  def index; end

  def profile
    @groups = Group.all
   
  end
end
