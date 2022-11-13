class StudentsController < ApplicationController

  before_filter :set_current_user, :only=> %w[show edit update delete]
  def student_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "Successfully created student account"
      redirect_to 'users/login'
    end
  end
  def show
    @student = @current_user.student
    #TODO: validate student not null -> faculty null / not
  end

  def edit
    @student = @current_user.student
    #TODO: validate student not null -> faculty null / not
    #TODO: go to editable student info form
  end

  def update
    @student = @current_user.student
    #TODO: validate student not null -> faculty null / not
    #TODO: go to editable student info form
  end

  def delete
    @student = @current_user.student
    @current_user.delete #TODO: ensure this will call user.delete and not student.dekete
    @student.delete
  end


end
