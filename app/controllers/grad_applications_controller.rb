class GradApplicationsController < ApplicationController

  before_action :authorized
  def grad_application_params
    params.require(:grad_applications).permit(:university, :research_area, :deg_obj, :deg_obj_major, :statement_of_purpose)
  end

  def show

  end

  def create


  end

  def new
    @user = current_user
  end


  def update

  end

  def destroy

  end
  
  def index
    @user == User.find_by(:email => session[:email])

  end



end