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
    LetterOfRecommendation.find_by_url([:id]).update(:letter => letter)
  end

  def self.create_letter(email, user)
    iterations = rand(1..100)
    i = 0
    url = "#{user.email}#{@email}"
    while i < iterations
      url = Digest::SHA256.hexdigest url
      i = i + 1
    end

    letter_of_recommendation = LetterOfRecommendation.new(:email => email, :url => url)

    if letter_of_recommendation.valid?
      letter_of_recommendation.save
      #Letter.with(user: user, url: url,email: email).email_recommender.deliver_now
    end

    letter_of_recommendation #this could have error messages associated; will need to check at higher scope
  end

  def create
    params = letter_of_recommendation_params
    letter = self.create_letter(params[:email],current_user)
    #check to see if letter has errors at this scope for error message handling
  end
end
