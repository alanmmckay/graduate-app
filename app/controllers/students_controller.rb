class StudentsController < ApplicationController

  before_filter :set_current_user, :only=> %w[show edit update delete]

  def student_params
    params.require(:student).permit(:fname, :lname, :address, :phone, :citizenship, :gender)
  end

  def user_params
    params.require(:user).permit(:fname, :lname, :address, :phone, :citizenship, :gender)
  end

  def degree_params
    params.require(:degree).permit(:name,:city,:degree_type,:major,:gpa)
  end

  def create
    #run update with user_params
    student = current_user.build_student(gender: student_params[:gender],citizenship: student_params[:citizenship])
    #validation
    student.save
    #"commit"=>"Continue"
    redirect_to students_degree_path
  end

  def edit
    @user = current_user
    @student = current_user.student
    if @student.methods.include?(:degrees)
      @degrees = @student.degrees
    else
      @degrees = nil
    end
  end

  def update
    info = student_params
    current_user.update(:fname => info[:fname], :lname => info[:lname], :phone => info[:phone])
    current_user.save
    current_user.student.update(:gender => info[:gender], :citizenship => info[:citizenship])
    redirect_to users_path
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

  def degree_confirmation
    degree = Degree.new(name: degree_params[:name], city: degree_params[:city], degree_type: degree_params[:degree_type], major: degree_params[:major], gpa: degree_params[:gpa])
    degree.save
    current_user.student.degrees << degree
    @degrees = current_user.student.degrees
  end

  def new
    @user = current_user
  end
end
