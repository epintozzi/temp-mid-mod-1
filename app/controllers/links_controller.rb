class LinksController < ApplicationController
  def index
    if !current_user
      redirect_to :login
    else
      @links = Link.all.where(user_id: current_user.id)
      @hot_links = Link.hot
    end
  end
end
