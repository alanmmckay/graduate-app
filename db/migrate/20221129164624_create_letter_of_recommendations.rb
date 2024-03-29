class CreateLetterOfRecommendations < ActiveRecord::Migration
  def up
    create_table :letter_of_recommendations do |t|
      t.belongs_to :grad_application
      t.string :recommender_email
      t.string :url
      t.string :letter
      t.boolean :submitted
      t.timestamps null:false
      end
  end

  def down
    drop_table :letter_of_recommendations
  end
end
