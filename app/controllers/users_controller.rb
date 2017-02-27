class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "You have successfully created an account"
      redirect_to :root
    else
      flash[:alert] = "There was a problem. #{user.errors.full_messages.join(' ')}. Please try again."
      redirect_to :signup
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
