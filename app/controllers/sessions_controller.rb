class SessionsController < ApplicationController
  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "You've signed in."
      session[:user_id] = @user.id
      redirect_to users_login_path
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      redirect_to users_path
    end
  end
  def omniauth
    #user = User.from_omniauth(request.env['omniauth.auth'])
    flash[:auth_info] = User.from_omniauth(request.env['omniauth.auth'])
    redirect_to users_login_path
=begin
    if user
      flash[:notice] = "You've signed in."
      session[:email] = user.email
      redirect_to users_show_path
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      redirect_to users_login_path
    end
=end
  end

  def destroy
    session[:email] = nil
    redirect_to users_login_path
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
