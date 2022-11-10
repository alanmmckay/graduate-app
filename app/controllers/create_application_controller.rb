class CreateApplicationController < ApplicationController
  def application_params
    params.require(:application).permit(:first_name, :last_name, :gender, :research_area, :deg_obj, :deg_obj_major)
  end

  def show
    # potentially assign an ID to every single application so they are all unique from each other
    last_name = params[:last_name] # retrieve application by searching last name, returns list maybe
    # if a list is returned, then maybe loop through till first name? or do something about same names
    @application = Application.find(last_name) # look up application by last name
  end

  def create
    @application = Application.create!(application_params)
    # flash[:notice] = "Application was successfully submitted."
    # redirect_to (path of student home page)
  end

  def update # Used for updating an application ? Maybe this won't be possible
    @application = Application.find params[:last_name]
    @application.update_attributes!(application_params)
    # flash[:notice] = "Application was successfully updated."
    # redirect_to student home page
  end

  def destroy # could be used for Withdrawing the Application
    @application = Application.find(params[:last_name])
    @application.destroy
    # flash[:notice] = "Your application has been deleted."
    # redirect_to student home page
  end
  
  def index
  end
end