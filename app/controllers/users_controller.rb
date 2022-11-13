class UsersController < ApplicationController

  def user_params
      params.require(:user).permit(:email, :password, :passwordV, :fname, :lname, :phone)
  end

  def show
    @users = User.all

  end

  def new

  end

  def create
    info = user_params
    if info[:password] == info[:passwordV]
      @user = User.create!(email: info[:email], password: info[:password], lname: info[:lname], fname: info[:fname], phone: info[:phone])
      redirect_to users_path
    else
      puts 'fail'
      flash[:notice] = "Passwords did not match"
      redirect_to users_new_path
    end
  end

end
