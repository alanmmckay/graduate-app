class UsersController < ApplicationController

  def user_params
      params.require(:user).permit(:name, :password, :passwordV)
  end

  def index
    @users = User.all
  end

  def new

  end

  def create
    info = user_params
    if info[:password] == info[:passwordV]
      @user = User.create!(name: info[:name], password: info[:password])
      redirect_to users_path
    else
      puts 'fail'
      flash[:notice] = "Passwords did not match"
      redirect_to users_new_path
    end
  end

end
