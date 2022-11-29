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
    sinfo = student_params
    uinfo = user_params


    @user = current_user
    @user.update(:fname => uinfo[:fname], :lname => uinfo[:lname], :phone => uinfo[:phone])
    @user.build_student(address: sinfo[:address], gender: sinfo[:gender],citizenship: sinfo[:citizenship])
    if @user.valid? #and @student.valid?
      @user.save
      redirect_to students_degree_path
    else
      flash[:errors] = @user.errors
      flash[:info] = uinfo.merge(sinfo)
      redirect_to students_new_path
    end
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
    #The params object is picky about where it receives data from. This is necessary with the current schema of the
    # controller

    sinfo = student_params
    uinfo = user_params
    @user = current_user
    @user.update(:fname => uinfo[:fname], :lname => uinfo[:lname], :phone => uinfo[:phone])
    @user.student.update(:address => sinfo[:address], :gender => sinfo[:gender], :citizenship => sinfo[:citizenship])
    if @user.valid?
      current_user.save
      redirect_to users_path
    else
      flash[:errors] = @user.errors
      flash[:info] = sinfo.merge(uinfo)
      redirect_to users_edit_path
    end
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

  def edit_degree

  end
  def degree_creation
    degree = Degree.new(name: degree_params[:name], city: degree_params[:city], degree_type: degree_params[:degree_type], major: degree_params[:major], gpa: degree_params[:gpa])
    degree.save
    current_user.student.degrees << degree
    @degrees = current_user.student.degrees
  end

  def new
    @user = current_user
  end
end
