class GradApplicationsController < ApplicationController

  before_action :authorized
  def grad_application_params
    params.require(:grad_application).permit(:university, :research_area, :deg_obj, :deg_obj_major, :statement_of_purpose, :recommender_1, :recommender_2, :recommender3, :fname, :lname, :address, :phone, :citizenship, :gender)
  end

  def student_params
    params.require(:student).permit(:university, :research_area, :deg_obj, :deg_obj_major, :statement_of_purpose, :recommender_1, :recommender_2, :recommender3, :fname, :lname, :address, :phone, :citizenship, :gender)
  end

  def user_params
    params.require(:user).permit(:university, :research_area, :deg_obj, :deg_obj_major, :statement_of_purpose, :recommender_1, :recommender_2, :recommender3, :fname, :lname, :address, :phone, :citizenship, :gender)
  end

  def letter_params
    params.require(:letter_of_recommendation).permit(:university, :research_area, :deg_obj, :deg_obj_major, :statement_of_purpose, :recommender_1, :recommender_2, :recommender3, :fname, :lname, :address, :phone, :citizenship, :gender)
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
    #letter_1 = LetterOfRecommendation.new(:recommender_email => linfo[:recommender_1])
    #letter_2 = LetterOfRecommendation.new(:recommender_email => linfo[:recommender_2])
    #letter_3 = LetterOfRecommendation.new(:recommender_email => linfo[:recommender_3])
    letter_1 = LetterOfRecommendationController::create_letter(linfo[:recommender_1],current_user)
    letter_2 = LetterOfRecommendationController::create_letter(linfo[:recommender_2],current_user)
    letter_3 = LetterOfRecommendationController::create_letter(linfo[:recommender_3],current_user)
    puts letter_1.valid?
    puts letter_2.valid?
    puts letter_3.valid?
    puts :heeeere
    puts letter_1.errors.keys
    if application.valid?  and letter_1.valid? and letter_2.valid? and letter_3.valid? and user.valid? and user.student.valid?

      redirect_to applications_path
    else
      puts letter_1.valid?
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