class SessionsController < ApplicationController
  def create
    @user = User.authenticate(params[:email], params[:password])
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    if @user
      flash[:notice] = "You've signed in."
      session[:user_id] = @user.id
      redirect_to users_login_path
    elsif user
      reset_session
      session[:user_id] = user.id
      redirect_to root_url, :notice => 'Signed in!'
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      redirect_to users_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've signed out."
    redirect_to users_path
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
