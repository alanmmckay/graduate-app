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
    if params[:user]
      @user = params[:user]
    end
  end

  def create
    info = user_params
    if info[:password] == info[:passwordV]
      @user = User.new(email: info[:email], password: info[:password], lname: info[:lname], fname: info[:fname], phone: info[:phone])
      if @user.valid?
        @user.save
        flash[:login] = "Account has been created. Please sign in:"
        redirect_to users_path
      else
        #using params here instead casts as string
        flash[:login] = @user.errors
        info.delete(:password)
        info.delete(:passwordV)
        flash[:info] = info
        redirect_to users_new_path
      end
    else
      flash[:login] = {:passwordV => ["Passwords did not match"]}
      info.delete(:password)
      info.delete(:passwordV)
      flash[:info] = info
      redirect_to users_new_path
    end
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

  def error
    #flash[:login] = session[:error]
    #redirect_to users_new_path params
  end
end
