class AddGradAppRefToGradAppReview < ActiveRecord::Migration
  def change
    add_reference :grad_app_reviews, :grad_application, index: true, foreign_key: true
    add_reference :grad_app_reviews, :faculty, index: true, foreign_key: true
  end
end