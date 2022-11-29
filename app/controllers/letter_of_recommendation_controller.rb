class LettersOfRecommendationController < ApplicationController

  def letter_of_recommendation_params
    params.require(:letter_of_recommendation).permit(:letter)
  end

  def edit

  end

  def create
    @params = letter_params
  end
end
