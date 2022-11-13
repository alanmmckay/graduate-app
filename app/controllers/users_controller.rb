class UsersController < ApplicationController

  def user_params
      params.require(:user).permit(:email, :password, :passwordV, :fname, :lname, :phone)
  end

  def login_params
    params.require(:user).permit(:email,:password)
  end
  def show
    @user = session[:user]
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

  def landing
    render users_login_path
  end

  def login
    info = login_params
    @user = User.find_by(email:info[:email])
    session[:user] = @user
    redirect_to users_show_path
  end

end
