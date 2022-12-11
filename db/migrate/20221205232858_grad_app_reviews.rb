class GradAppReviews < ActiveRecord::Migration

  def change
    create_table :grad_app_reviews do |t|
      t.belongs_to :grad_applications, :faculty
      t.text :comments
      t.integer :score

    end
  end

end

