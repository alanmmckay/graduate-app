# class GradApplicationController < ApplicationController
#
#   before_action :authorized
#   before_filter :set_current_grad_application, :only=> %w[show edit update delete]
#   def grad_application_params
#     params.require(:grad_application).permit(:university, :date, :first_name, :last_name, :citizenship, :gender,
#                                              :research_area, :deg_obj, :deg_obj_major, :ug_inst, :ug_inst_city,
#                                              :ug_gpa, :ug_deg_earned, :grad_inst, :grad_inst_city, :grad_gpa,
#                                              :grad_deg_earned, :recommender_1, :recommender_2, :recommender_3)
#   end
#
#   def show
#     # potentially assign an ID to every single GradApplications so they are all unique from each other
#     last_name = params[:last_name] # retrieve GradApplications by searching last name, returns list maybe
#     # if a list is returned, then maybe loop through till first name? or do something about same names
#     @grad_application = GradApplication.find(last_name)# look up GradApplications by last name
#   end
#
#   def create_student
#
#   end
#   def create
#
#     @params = grad_application_params
#     @grad_application = @current_grad_application
#
#     @grad_application.update(@params)
#
#     if @grad_application.valid?
#       @grad_application.save!
#       redirect_to ## grad_application_faculty_test_path #(student home page)
#       flash[:notice] = "Application has been successfully submitted"
#     else
#       flash[:requirement] = @grad_application.errors
#       render grad_application_new_path
#     end
#   end
#
#   def new
#
#     student = Student.find_by(:id => User.find_by(:email => session[:email]))
#     @grad_application = student.grad_applications
#
#     if !student
#       redirect_to students_new_path
#     elsif student.degrees.length == 0
#       redirect_to students_degree_path
#     end
#
#
#     # default: render 'new' template
#   end
#
#   def update # Used for updating an GradApplications ? Maybe this won't be possible
#     @grad_application = GradApplication.find params[:last_name]
#     @grad_application.update_attributes!(grad_application_params)
#     # flash[:notice] = "GradApplication was successfully updated."
#     # redirect_to student home page
#   end
#
#   def destroy # could be used for Withdrawing the GradApplication
#     @grad_application = GradApplication.find(params[:id])
#     @grad_application.destroy
#     # flash[:notice] = "Your GradApplications has been deleted."
#     # redirect_to student home page
#   end
#
#   def index
#     @user == User.find_by(:email => session[:email])
#
#   end
#
#
#   def get_app_by_dep
#
#     # based on the filter for the applications
#     applications_list = GradApplication.find_by_university("University of Iowa")
#     #applications_list = GradApplication.all
#
#     1.upto 10 do |q|
#       puts "&&&&&&&&&&&&&"
#     end
#     puts applications_list
#     applications_list.each do |i|
#       puts i[:first_name]
#     end
#
#   end
#
#   def faculty_test
#     @all_applications = GradApplication.all
#     @all_applications.each do |app|
#       puts app[:first_name]
#     end
#
#   end
#
# end


class GradApplicationsController < ApplicationController

  before_action :authorized
  def grad_application_params
    params.require(:grad_application).permit(:university, :research_area, :deg_obj, :deg_obj_major, :statement_of_purpose, :recommender_1, :recommender_2, :recommender_3, :fname, :lname, :address, :phone, :citizenship, :gender)
  end

  def student_params
    params.require(:student).permit(:university, :research_area, :deg_obj, :deg_obj_major, :statement_of_purpose, :recommender_1, :recommender_2, :recommender_3, :fname, :lname, :address, :phone, :citizenship, :gender)
  end

  def user_params
    params.require(:user).permit(:university, :research_area, :deg_obj, :deg_obj_major, :statement_of_purpose, :recommender_1, :recommender_2, :recommender_3, :fname, :lname, :address, :phone, :citizenship, :gender)
  end

  def letter_params
    params.require(:letter_of_recommendation).permit(:university, :research_area, :deg_obj, :deg_obj_major, :statement_of_purpose, :recommender_1, :recommender_2, :recommender_3, :fname, :lname, :address, :phone, :citizenship, :gender)
  end
  def show

  end

  def create
    puts params
    uinfo = user_params
    sinfo = student_params
    ginfo = grad_application_params
    linfo = letter_params

    user = current_user
    user.update(:fname => uinfo[:fname], :lname => uinfo[:lname], :phone => uinfo[:phone])
    user.student.update(address: sinfo[:address], gender: sinfo[:gender],citizenship: sinfo[:citizenship])
    application = GradApplication.new(university: ginfo[:university], date: Time.now, research_area: ginfo[:research_area], deg_obj: ginfo[:deg_obj], deg_obj_major: ginfo[:deg_obj_major], statement_of_purpose: ginfo[:statement_of_purpose])
    letter_1 = LetterOfRecommendationController::create_letter(linfo[:recommender_1],current_user)
    letter_2 = LetterOfRecommendationController::create_letter(linfo[:recommender_2],current_user)
    letter_3 = LetterOfRecommendationController::create_letter(linfo[:recommender_3],current_user)
    if application.valid?  and letter_1.valid? and letter_2.valid? and letter_3.valid? and user.valid? and user.student.valid?
      application.letter_of_recommendations << letter_1
      application.letter_of_recommendations << letter_2
      application.letter_of_recommendations << letter_3
      user.student.grad_applications << application
      user.save
      user.student.save
      application.save
      letter_1.save
      letter_2.save
      letter_3.save
      redirect_to applications_path
    else
      flash[:info] = uinfo.merge(sinfo).merge(ginfo).merge(linfo)
      flash[:errors] = user.errors
      flash[:app_errors] = application.errors
      flash[:r1errors] = letter_1.errors
      flash[:r2errors] = letter_2.errors
      flash[:r3errors] = letter_3.errors
      flash[:warning] = "Error in submission form, please ensure all fields are correct"
      redirect_to applications_new_path
    end

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