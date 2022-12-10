class ChangeRecommenderEmailToEmail < ActiveRecord::Migration
  def change
    rename_column(:letter_of_recommendations, :recommender_email, :email)
  end
end
