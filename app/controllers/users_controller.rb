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
    #puts request.path
    if session[:email]
      @user_info = {:Name => current_user.name, :Email => current_user.email, :Phone => current_user.phone}
      if is_student? current_user
        student = current_user.student
        @student_info = {:Address => student.address, :Citizenship => student.citizenship, :Gender => student.gender}
        @user_info = @user_info.merge(@student_info)
        if has_degree? current_user
          @degrees = @user.degrees
        end
      end
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
    @user = current_user
    @user.update(:fname => info[:fname], :lname => info[:lname], :phone => info[:phone])
    if @user.valid?
      @user.save
      redirect_to users_path
    else
      flash[:errors] = @user.errors
      flash[:info] = info
      redirect_to users_edit_path
    end
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
      redirect_to users_show_path
    else
      render users_login_path
    end
  end

  def login
    info = login_params
    @user = User.find_by(email:info[:email].downcase)
    if @user and @user.authenticate(info[:password])
      session[:email] = info[:email]
      session[:nav] = {"Log out" => users_logout_path}
      if is_student? @user
        if has_degree? @user
          application_path = {"Continue Application" => grad_applications_new_path, "Edit User Information" => students_edit_path }
        else
          application_path = {"Continue Application" => students_degree_path, "Edit User Information" => students_edit_path }
        end
      else
        application_path = {"Begin Application" => students_new_path, "Edit User Information" => users_edit_path}
      end
      session[:nav] = application_path.merge(session[:nav])
      redirect_to users_show_path
    else
      flash[:login] = "Invalid Credentials"
      flash[:info] = {:email => info[:email]}
    end
  end

  def destroy
    session[:email] = nil
    session[:nav] = nil
    redirect_to users_login_path
  end

end
