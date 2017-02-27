class Api::V1::LinksController < ApplicationController


  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      render json: @link, status: 201

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link

    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def update
    @link = Link.find(params[:id])
    # @link.assign_attributes(link_params)
    # just_read = @link.read_changed? && @link.read
    if @link.update_attributes(link_params)
      BunnyService.new.send_link(@link.url)
      # Read.create(link: @link) if just_read
      # head :no_content
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:id, :title, :url, :read, :user_id)
  end
end
