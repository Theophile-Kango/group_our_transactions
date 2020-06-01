class PagesController < ApplicationController
  
  def index; end

  def profile
    @groups = Group.all 
    @groups = @groups.includes([:icon_attachment])
  end
end
