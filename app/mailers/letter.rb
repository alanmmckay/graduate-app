class Letter < ApplicationMailer
  default from: "recommendation-request@graduate.application.com"

  def email_recommender
    @user = current_user
    @base_url = 'http://letter_of_recommendation/edit/' #TODO: add base url path to heroku deployment
    @url_suffix = params[:url]
    @email = params[:email]
    mail(to: @email, subject: 'Request for Letter of Recommendation')
  end
end
