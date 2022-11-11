class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:name)
  end
  def index
    @users = User.all
  end

  def new

  end

  def create
    @user = User.create!(user_params)
    redirect_to users_path
  end

end
