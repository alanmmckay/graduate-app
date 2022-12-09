class FacultyController < ApplicationController

  # before_filter :set_current_user, :only=> %w[show edit update delete]

  def student_params
    params.require(:student).permit(:fname, :lname, :address, :phone, :citizenship, :gender)
  end

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

  def create
    #run update with user_params
    sinfo = student_params
    uinfo = user_params

    @user = current_user
    @user.update(:fname => uinfo[:fname], :lname => uinfo[:lname], :phone => uinfo[:phone])
    @user.build_student(address: sinfo[:address], gender: sinfo[:gender],citizenship: sinfo[:citizenship])
    if @user.valid? #and @student.valid?
      @user.save
      session[:nav].delete("Begin Application")
      session[:nav] = {"Continue Application" => students_degree_path}.merge(session[:nav])
      session[:nav]["Edit User Information"] = students_edit_path
      redirect_to students_degree_path
    else
      flash[:errors] = @user.errors
      flash[:info] = uinfo.merge(sinfo)
      redirect_to students_new_path
    end
  end


  def home

    @grad_applications = GradApplication.where(university: "University of Iowa")
    render faculty_home_path

  end


  def submit_application_review
    par_score = params.require(:score_select)[:score]
    par_comments = params.require(:comments)
    app_id = params.require(:app_id).keys[0]

    puts par_score
    puts par_comments
    puts app_id

    @reviewed_grad_application = GradApplication.find_by_id(app_id)

    review = GradApplicationReview.new(:comments => par_comments, :score => par_score, :grad_application_id => app_id)
    if review.valid?
      review.save!
      @reviewed_grad_application.grad_application_reviews << review # might want this to grad application to belong to the faculty
      redirect_to faculty_home_path
    else
      #flash errors
      render faculty_review_grad_application_path
    end

    # @reviewed_grad_application = GradApplication.find_by_id(app_id)
    # puts @reviewed_grad_application[:first_name]
    #
    # @grad_application_review = @reviewed_grad_application.grad_application_reviews
    # @grad_application_review.update([:comments => par_comments, :score => :par_score]) ## faculty reviewer => current user
    # @grad_application_review.save!
    #
    # redirect_to faculty_home_path


  end

  def review_grad_application
    # placeholder
    # get the grad application ID
    review_id = review_grad_application_params

    @grad_application_review = GradApplication.find_by_id(review_id)


  end

  def view_recommendation_letter
    # get the number of letter from the params,
    # use @recommendation letter = @grad_application_review[params]

  end

  def submit_review

    # go back to home page
    # mark the application review to be true or something,
    # or alternative way is to check on the home page that
    #   the faculty user has comments, maybe application_review belongs to faculty?? might be the way to go
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
    dinfo = degree_params
    degree = Degree.new(name: dinfo[:name], city: dinfo[:city], degree_type: dinfo[:degree_type], major:dinfo[:major], gpa: dinfo[:gpa])
    if degree.valid?
      degree.save
      current_user.student.degrees << degree
      session[:nav].delete("Continue Application")
      session[:nav] = {"Continue Application": grad_application_new_path}.merge(session[:nav])
      flash[:degree] = "Degree from " + dinfo[:name] + " successfully added. To finish, select continue application."
      redirect_to students_degree_path
    else
      flash[:info] = dinfo
      flash[:errors] = degree.errors
      redirect_to students_degree_path
    end
  end

  def new
    @user = current_user
  end
end
