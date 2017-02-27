class Api::V1::LinksController < ApplicationController

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    binding.pry
    if @link.save
      render json: @link, status: 201
    else
      binding.pry
      render json: @link.errors.full_messages, status: 500
    end
    binding.pry
  end

  def update
    @link = Link.find params[:id]
    @link.assign_attributes link_params
    just_read = @link.read_changed? && @link.read
    if @link.save
      Read.create(link: @link) if just_read
      head :no_content
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:id, :title, :url, :read, :user_id)
  end
end
