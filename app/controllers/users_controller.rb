class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account successfully created!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating the account. Please try again."
      redirect_to :back
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
