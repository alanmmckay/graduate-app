class LetterOfRecommendationController < ApplicationController

  def letter_of_recommendation_params
    params.require(:letter_of_recommendation).permit(:email,:letter)
  end

  def edit
    @letter_of_recommendation = LetterOfRecommendation.find_by_url(params[:id])
    @student = @letter_of_recommendation.grad_application.student
  end

  def update
    letter = letter_of_recommendation_params[:letter]
    if params[:submit].to_bool
      LetterOfRecommendation.find_by_url(params[:id]).update(:letter => letter,:submitted => true)
      flash[:notice] = 'Letter of recommendation successfully submitted'
      redirect_to users_login_path
    else
      LetterOfRecommendation.find_by_url(params[:id]).update(:letter => letter,:submitted => false)
      flash[:notice] = 'Letter of recommendation successfully saved'
      redirect_to letter_of_recommendation_update_path+'/'+params[:id].to_s
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
      #Letter.with(user: user, url: url,email: email).email_recommender.deliver_now
    end

    letter_of_recommendation #this could have error messages associated; will need to check at higher scope
  end

  def create
    params = letter_of_recommendation_params
    letter = self.create_letter(params[:email],current_user)
    #check to see if letter has errors at this scope for error message handling
    letter.save
  end
end
