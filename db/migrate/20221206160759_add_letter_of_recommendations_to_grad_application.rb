class AddLetterOfRecommendationsToGradApplication < ActiveRecord::Migration
  def change
    add_reference :letter_of_recommendations, :grad_application_id, index: true, foreign_key: true
  end
end
