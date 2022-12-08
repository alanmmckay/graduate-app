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
    @user_info = {:Name => current_user.name, :Email => current_user.email, :Phone => current_user.phone}
    @student_info = {:Gender => current_user.student.gender, :Citizenship => current_user.student.citizenship}
    @degrees = current_user.degrees
    application = current_user.student.grad_applications.find(params[:id])
    @application_info = {:University => application.university, :Objective => application.deg_obj, "Field of Interest" => application.deg_obj_major, "Reasearch Area" => application.research_area, "Statement of Purpose" => application.statement_of_purpose, :Status => application.status}
  end

  def create
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
    if application.valid?  and letter_1.valid? and letter_2.valid? and letter_3.valid? and user.valid? and user.student.valid? and not has_script?(ginfo[:statement_of_purpose])
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
      if session[:nav]["Continue Application"]
        session[:nav].delete("Continue Application")
        session[:nav] = {"View Applications" => applications_path}.merge(session[:nav])
      end
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

  def edit
    application = current_user.student.grad_applications.find(params[:id])
    letters = application.letter_of_recommendations
    @application_content = {}
    @application_content[:university] = application.university
    @application_content[:research_area] = application.research_area
    @application_content[:deg_obj] = application.deg_obj
    @application_content[:deg_obj_major] = application.deg_obj_major
    @application_content[:recommender_1] = letters[0].email
    @application_content[:recommender_2] = letters[1].email
    @application_content[:recommender_3] = letters[2].email
    @application_content[:statement_of_purpose] = application.statement_of_purpose


  end

  def update

  end

  def destroy
    application = current_user.student.grad_applications.find(params[:id])
    letter_1 = application.letter_of_recommendations[0]
    letter_2 = application.letter_of_recommendations[1]
    letter_3 = application.letter_of_recommendations[2]
    letter_1.destroy
    letter_2.destroy
    letter_3.destroy
    application.destroy
    flash[:notice] = "Application has been withdrawn"
    redirect_to users_path
  end
  
  def index
    applications = current_user.student.grad_applications
    if applications.length == 0
      redirect_to users_path
    elsif applications.length > 1

    else
      redirect_to applications_show_path(applications[0].id)
    end
  end



end