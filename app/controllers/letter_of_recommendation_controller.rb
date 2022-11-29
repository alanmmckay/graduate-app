class LetterOfRecommendationController < ApplicationController

  def letter_of_recommendation_params
    params.require(:letter_of_recommendation).permit(:recommender_email,:letter)
  end

  def edit

  end

  def update

  end

  def create
    @params = letter_of_recommendation_params
    @params[:url] = Digest::SHA256.digest "#{current_user.email}#{@params[:recommender_email]}"

    @letter_of_recommendation = LetterOfRecommendation.new(@params)

    if @letter_of_recommendation.valid?
      @letter_of_recommendation.save!
      redirect_to # letter submitted view
      flash[:notice] = "Letter of recommendation successfully submitted"
    else
      flash[:requirement] = @letter_of_recommendation.errors
      render # where to go?
    end
  end
end
