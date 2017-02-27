class LinksController < ApplicationController
  def index
    if !current_user
      redirect_to :login
    else
      @links = Link.all.where(user_id: current_user.id)
      @hot_links = Link.hot
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Your link has been updated"
      redirect_to root_path
    else
      flash[:alert] = ""
      render :edit
    end
  end


  private

  def link_params
    params.require(:link).permit(:id, :url, :title, :user_id, :read)
  end
end
