class UsersController < ApplicationController

  before_action :authorized, only: [:show]
  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :fname, :lname, :phone)
  end

  def update_user_params
    params.require(:user).permit(:fname,:lname,:phone)
  end
  def login_params
    params.require(:user).permit(:email,:password)
  end

  def show
    if session[:email]
      @email = session[:email]
    else
      redirect_to users_path
    end
  end

  def new
    if params[:user]
      @user = params[:user]
    end
  end

  def update
    info = update_user_params
    current_user.update(:fname => info[:fname], :lname => info[:lname], :phone => info[:phone])
    current_user.save
    redirect_to users_path
  end
  def edit
    if current_user.student
      redirect_to students_edit_path
    end
    @user = current_user
  end
  def create
    info = user_params
    #Need to consider range of acceptable values for these parameters; their domains
      @user = User.new(email: info[:email], password: info[:password], password_confirmation: info[:password_confirmation], lname: info[:lname], fname: info[:fname], phone: info[:phone])
      if @user.valid?
        @user.save
        #puts @user
        flash[:login] = "Account has been created. Please sign in:"
        redirect_to users_path
      else
        #using params here will instead cast as string
        flash[:login] = @user.errors
        info.delete(:password)
        info.delete(:password_confirmation)
        flash[:info] = info
        redirect_to users_new_path
      end
  end

  def landing
    if logged_in?
      render users_show_path
    else
      render users_login_path
    end
  end

  def login
    info = login_params
    @user = User.find_by(email:info[:email].downcase)
    if @user and @user.authenticate(info[:password])
      session[:email] = info[:email]
      redirect_to users_show_path
    else
      flash[:login] = "Invalid Credentials"
      flash[:info] = {:email => info[:email]}
    end
  end

  def destroy
    session[:email] = nil
    redirect_to users_login_path
  end

end
