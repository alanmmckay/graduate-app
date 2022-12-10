class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def current_user
    if session[:email]
      @user = User.find_by(email:session[:email])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to users_login_path unless logged_in?
  end
  def is_student?(user)
    !user.student.nil?
  end
  def has_degree?(user)
    user.degrees.exists? and user.degrees.length > 0
  end

  def has_application?(user)
    user.student.grad_applications.exists? and user.student.grad_applications.length > 0
  end
  def has_script?(html)
    html.include?("<script") or html.include?("</script>")
  end

  protect_from_forgery with: :exception

  protected
  def set_current_user
    @current_user ||= session[:session_token] && User.find_by_session_token(session[:session_token])
  end


end
