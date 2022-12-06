class GradApplicationController < ApplicationController

  before_action :authorized
  def grad_application_params
    params.require(:grad_application).permit(:university, :research_area, :deg_obj, :deg_obj_major, :statement_of_purpose)
  end

  def show

  end

  def create

    @params = grad_application_params
    @grad_application = GradApplication.new(@params)

    if @grad_application.valid?
      @grad_application.save!
      redirect_to ## grad_application_faculty_test_path #(student home page)
      flash[:notice] = "Application has been successfully submitted"
    else
      flash[:requirement] = @grad_application.errors
      render grad_application_new_path
    end
  end

  def new
    @user = current_user
  end


  def update # Used for updating an GradApplications ? Maybe this won't be possible
    @grad_application = GradApplication.find params[:last_name]
    @grad_application.update_attributes!(grad_application_params)
    # flash[:notice] = "GradApplication was successfully updated."
    # redirect_to student home page
  end

  def destroy # could be used for Withdrawing the GradApplication
    @grad_application = GradApplication.find(params[:id])
    @grad_application.destroy
    # flash[:notice] = "Your GradApplications has been deleted."
    # redirect_to student home page
  end
  
  def index
    @user == User.find_by(:email => session[:email])

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