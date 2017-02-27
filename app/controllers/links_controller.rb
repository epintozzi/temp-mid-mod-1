class LinksController < ApplicationController
  def index
    if !current_user
      redirect_to :login
    else
      @hot_links = Link.hot
    end
  end
end
