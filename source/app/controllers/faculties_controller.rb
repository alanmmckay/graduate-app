class FacultiesController < ApplicationController

  before_filter :set_current_user, :only=> %w[show edit update delete]

  def user_params
    params.require(:user).permit(:fname, :lname, :address, :phone, :citizenship, :gender)
  end

  def review_grad_application_params
    params.require(:id)
  end

  def submit_application_review_params
    params.require(:comments)
    params.require(:score_select)
  end

  def scrub_html(string)
    string.gsub(/<div class="ql-editor" data-gramm="false" contenteditable="true">/,"<div class='ql-editor' data-gramm='false' contenteditable='false'>").gsub(/<\s*s\s*c\s*r\s*i\s*p\s*t\s*/,"").gsub(/<\s*\/\s*s\s*c\s*r\s*i\s*p\s*t\s*>/,"")
  end

  def create

    @user = current_user

  end

  def home

    faculty_university = current_user.faculty.university

    if !params[:application_sort].nil?
      @app_filter = params[:application_sort][:select_application_sort]
    else
      @app_filter = "All Applications"
    end

    @grad_applications = GradApplication.where(university: faculty_university)
    @students_with_apps = []
    @user_students_with_apps = []
    @faculty_reviews = []
    @grad_applications.each do |student_application|
      student = Student.find_by_id(student_application[:student_id])
      user = User.find_by_id(student[:user_id])
      @students_with_apps.append(student)
      @user_students_with_apps.append(user)
      if GradAppReview.where(faculty_id: current_user.faculty.id, grad_application_id: student_application.id)[0].nil?
        @faculty_reviews.append(false)
      else
        @faculty_reviews.append(true)
      end
    end

    render faculty_home_path

  end

  def review_grad_application

    review_id = review_grad_application_params

    @grad_application_review = GradApplication.find_by_id(review_id)
    @letter_of_recommendations = LetterOfRecommendation.where(grad_application_id: review_id)
    @student_to_review = Student.find_by_id(@grad_application_review[:student_id])
    @user_to_review = User.find_by_id(@student_to_review[:user_id])
    @degrees_to_review = Degree.where(student_id: @student_to_review.id)
    @faculty_review = GradAppReview.where(faculty_id: current_user.faculty.id, grad_application_id: review_id)[0]

    @statement_of_purpose = scrub_html(@grad_application_review.statement_of_purpose.to_s)

    render faculty_review_grad_application_path

  end


  def submit_application_review
    par_score = params.require(:score_select)[:score]
    par_comments = params.require(:grad_application)[:comments]
    app_id = params.require(:app_id).keys[0]

    if par_comments.empty?
      par_comments = "Add your comments here"
    end

    @reviewed_grad_application = GradApplication.find_by_id(app_id)
    @faculty = current_user.faculty

    review = GradAppReview.new(:comments => par_comments, :score => par_score)
    if review.valid?
      review.save!
      @reviewed_grad_application.grad_app_reviews << review # might want this to grad application to belong to the faculty
      @faculty.grad_app_reviews << review
      redirect_to faculty_home_path
    else
      #flash errors if missing fields
      render faculty_review_grad_application_path
    end

  end


  def update_application_review

    grad_review_id = params.require(:review_id).keys[0]
    par_comments = params.require(:grad_application)[:comments]
    par_score = params.require(:score_select)[:score]
    if par_comments.empty? or par_comments == "Add your comments here"
      par_comments = "Add your comments here"
    end

    review = GradAppReview.find_by_id(grad_review_id)
    review.update(:comments => par_comments, :score => par_score)

    if review.valid?
      review.save!
      redirect_to faculty_home_path
    else
      # flash errors
      render faculty_review_grad_application_path
    end

  end




  def view_recommendation_letter
    # get the number of letter from the params,
    # use @recommendation letter = @grad_application_review[params]

  end


  def edit
    @user = current_user
    @faculty = current_user.faculty
    # placeholder
  end


  def update
    #place holder
  end

  def delete
    flash[:notice] = "#{@current_user.username} account deleted"
    @faculty = @current_user.student
    @current_user.delete
    @faculty.delete
    redirect_to 'user/login'
  end

  def new
    @user = current_user
  end
end
