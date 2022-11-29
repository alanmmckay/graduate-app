class CreateLettersOfRecommendations < ActiveRecord::Migration
  def change
    create_table :letters_of_recommendations do |t|

      t.timestamps null: false
    end
  end
end
