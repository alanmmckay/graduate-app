class LetterOfRecommendationController < ApplicationController

  def letter_of_recommendation_params
    params.require(:letter_of_recommendation).permit(:recommender_email,:letter)
  end

  def edit
    @letter_of_recommendation = LetterOfRecommendation.find_by_url(params[:id])
    @student = @letter_of_recommendation.grad_application.student
  end

  def update
    letter = letter_of_recommendation_params[:letter]
    LetterOfRecommendation.find_by_url([:id]).update(:letter => letter)
  end

  def create
    @params = letter_of_recommendation_params
    iters = rand(1..100)
    i = 0
    url = "#{current_user.email}#{@params[:recommender_email]}"
    while i < iters
      url = Digest::SHA256.digest.hexdigest url
      i = i + 1
    end
    @params[:url] = url

    @letter_of_recommendation = LetterOfRecommendation.new(@params)

    if @letter_of_recommendation.valid?
      @letter_of_recommendation.save!
      Letter.with(user: current_user, url: url,email: @params[:recommender_email]).email_recommender.deliver_now
    else
      flash[:requirement] = @letter_of_recommendation.errors
    end
  end
end
