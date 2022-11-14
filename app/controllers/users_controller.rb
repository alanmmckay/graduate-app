class UsersController < ApplicationController

  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :fname, :lname, :phone)
  end

  def login_params
    params.require(:user).permit(:email,:password)
  end
  def show
    @user = session[:user]
  end

  def new
    if params[:user]
      @user = params[:user]
    end
  end

  def create
    info = user_params
    #Need to consider range of acceptable values for these parameters; their domains
      @user = User.new(email: info[:email], password: info[:password], password_confirmation: info[:password_confirmation], lname: info[:lname], fname: info[:fname], phone: info[:phone])
      if @user.valid?
        @user.save
        flash[:login] = "Account has been created. Please sign in:"
        redirect_to users_path
      else
        #using params here will instead cast as string
        flash[:login] = @user.errors
      end
        info.delete(:password)
        info.delete(:password_confirmation)
        flash[:info] = info
        redirect_to users_new_path
  end

  def landing
    render users_login_path
  end

  def login
    info = login_params
    @user = User.find_by(email:info[:email].downcase)
    session[:user] = @user
    redirect_to users_show_path params
  end

end
