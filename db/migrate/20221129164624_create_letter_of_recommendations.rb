class CreateLetterOfRecommendations < ActiveRecord::Migration
  def change
    create_table :letter_of_recommendations do |t|

      t.timestamps null: false
    end
  end
end
