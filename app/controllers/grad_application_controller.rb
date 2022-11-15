class GradApplicationController < ApplicationController
  def grad_application_params
    params.require(:grad_application).permit(:first_name, :last_name, :gender, :research_area, :deg_obj, :deg_obj_major)
  end

  def show
    # potentially assign an ID to every single GradApplications so they are all unique from each other
    last_name = params[:last_name] # retrieve GradApplications by searching last name, returns list maybe
    # if a list is returned, then maybe loop through till first name? or do something about same names
    @grad_application = GradApplication.find(last_name) # look up GradApplications by last name
  end

  def create
    1.upto (10) do |i|
      puts "%%"
    end
    @params = grad_application_params
    if @params[:first_name] == ""
      flash[:notice] = "Missing fields"
      redirect_to grad_application_new_path #(student home page)
    else
      @grad_application = GradApplication.create!(grad_application_params)
      flash[:notice] = "Application was successfully submitted."
      redirect_to grad_application_faculty_test_path #(student home page)
    end
  end

  def new
    1.upto (10) do |i|
      puts "@@"
    end
    # default: render 'new' template
  end

  def update # Used for updating an GradApplications ? Maybe this won't be possible
    @grad_application = GradApplication.find params[:last_name]
    @grad_application.update_attributes!(grad_application_params)
    # flash[:notice] = "GradApplication was successfully updated."
    # redirect_to student home page
  end

  def destroy # could be used for Withdrawing the GradApplication
    @grad_application = GradApplication.find(params[:last_name])
    @grad_application.destroy
    # flash[:notice] = "Your GradApplications has been deleted."
    # redirect_to student home page
  end
  
  def index
  end


  def get_app_by_dep

    # based on the filter for the applications
    applications_list = find_application_by_department("CSE")

  end

  def faculty_test
    @all_applications = GradApplication.all
    @all_applications.each do |app|
      puts app[:first_name]
    end

  end

end