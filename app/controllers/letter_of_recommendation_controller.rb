class LetterOfRecommendationController < ApplicationController

  def letter_of_recommendation_params
    params.require(:letter_of_recommendation).permit(:email,:letter)
  end

  def scrub_html(string)
    string.gsub(/<div class="ql-editor" data-gramm="false" contenteditable="true">/,"<div class='ql-editor' data-gramm='false' contenteditable='false'>").gsub(/<\s*s\s*c\s*r\s*i\s*p\s*t\s*/,"").gsub(/<\s*\/\s*s\s*c\s*r\s*i\s*p\s*t\s*>/,"")
  end

  def edit
    @letter_of_recommendation = LetterOfRecommendation.find_by_url(params[:id])
    if @letter_of_recommendation.submitted == true
      flash[:warning] = 'Letter of recommendation already submitted'
      redirect_to users_login_path and return
    end
    @student = @letter_of_recommendation.grad_application.student
  end

  def update
    letter = scrub_html(letter_of_recommendation_params[:letter])
    LetterOfRecommendation.find_by_url(params[:id]).update(:letter => letter,:submitted => false)
    flash[:notice] = 'Letter of recommendation successfully saved'
    redirect_to '/letter_of_recommendation/show/'+params[:id].to_s
  end

  def submit
    LetterOfRecommendation.find_by_url(params[:id]).update(:submitted => true)
    flash[:notice] = 'Letter of recommendation successfully submitted'
    redirect_to users_login_path
  end

  def show
    @letter_of_recommendation = LetterOfRecommendation.find_by_url(params[:id])
    if @letter_of_recommendation.submitted == true
      flash[:warning] = 'Letter of recommendation already submitted'
      redirect_to users_login_path and return
    end
  end

  def self.create_letter(email, user)
    iterations = rand(1..10000)
    i = 0
    url = "#{user.email}#{@email}"
    while i < iterations
      url = Digest::SHA256.hexdigest url
      i = i + 1
    end
    letter_of_recommendation = LetterOfRecommendation.new(:email => email, :url => url)

    if letter_of_recommendation.valid?
      Letter.email_recommender(user: user, url: url,email: email).deliver_now
    end

    letter_of_recommendation #this could have error messages associated; will need to check at higher scope
  end

  def index
    @letter_of_recommendations = LetterOfRecommendation.all
  end

  def create
    params = letter_of_recommendation_params
    letter = self.create_letter(params[:email],current_user)
    #check to see if letter has errors at this scope for error message handling
    letter.save
  end
end
