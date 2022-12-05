class CreateLetterOfRecommendations < ActiveRecord::Migration
  def up
    t.belongs_to :grad_application
    t.string :recommender_email
    t.string :url
    t.string :letter
  end

  def down
    drop_table :letter_of_recommendations
  end
end
