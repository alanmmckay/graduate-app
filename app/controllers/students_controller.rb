class StudentsController < ApplicationController

  before_filter :set_current_user, :only=> %w[show edit update delete]

  def student_params
    params.require(:user_id).permit(:fname, :lname, :app_status)
    #TODO: does user_id need to be required? Or will it always be instantiated when linking to user account
  end

  def create
    @student = Student.new(student_params)
    if @current_user << @student
      flash[:notice] = "Successfully created student account"
      redirect_to 'users/login'
    end
  end

  def show
    redirect_to 'users/show'
    #TODO: validate student not null -> faculty null / not
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

  def home
    @student = @current_user.student
    @applications = @student.grad_applications
  end


end
