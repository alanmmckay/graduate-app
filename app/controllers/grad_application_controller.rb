class GradApplicationController < ApplicationController

  before_action :authorized
  def grad_application_params
    params.require(:grad_application).permit(:university, :date, :first_name, :last_name, :citizenship, :gender,
                                             :research_area, :deg_obj, :deg_obj_major, :ug_inst, :ug_inst_city,
                                             :ug_gpa, :ug_deg_earned, :grad_inst, :grad_inst_city, :grad_gpa,
                                             :grad_deg_earned, :recommender_1, :recommender_2, :recommender_3)
  end

  def show
    # potentially assign an ID to every single GradApplications so they are all unique from each other
    last_name = params[:last_name] # retrieve GradApplications by searching last name, returns list maybe
    # if a list is returned, then maybe loop through till first name? or do something about same names
    @grad_application = GradApplication.find(last_name)# look up GradApplications by last name
  end

  def create_student

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

    student = Student.find_by(:id => User.find_by(:email => session[:email]))

    if !student
      redirect_to students_new_path
    elsif student.degrees.length == 0
      redirect_to students_degree_path
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