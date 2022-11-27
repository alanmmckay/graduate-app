class StudentsController < ApplicationController

  before_filter :set_current_user, :only=> %w[show edit update delete]

  def student_params
    params.require(:student).permit(:fname, :lname, :address, :phone, :citizenship, :gender)
    #TODO: does user_id need to be required? Or will it always be instantiated when linking to user account
  end

  def user_params
    params.require(:user).permit(:fname, :lname, :address, :phone, :citizenship, :gender)
  end

  def create
    #run update with user_params
    student = current_user.build_student(gender: student_params[:gender],citizenship: student_params[:citizenship])
    #validation
    student.save
    redirect_to students_degree_path


  end

  def edit
    @student = @current_user.student
    #TODO: validate student not null -> faculty null / not
    #TODO: go to editable student info form
  end

  def update
    @student = @current_user.student
    @student.update_attributes!(student_params)
    flash[:notice] = "#{@current_user.username} student account successfully updated."
    redirect_to 'student/show'
    #TODO: validate student not null -> faculty null / not
  end

  def delete
    flash[:notice] = "#{@current_user.username} account deleted"
    @student = @current_user.student
    @current_user.delete #TODO: ensure this will call user.delete and not student.delete
    @student.delete
    redirect_to 'user/login'
  end

  def degree

  end
  def new
    user = User.find_by(email: session[:email])
    @fname = user.fname
    @lname = user.lname
    @address = user.address
    @phone = user.phone
  end
end
