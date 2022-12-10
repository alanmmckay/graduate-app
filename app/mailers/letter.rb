class Letter < ApplicationMailer
  default from: "recommendation-request@graduate.application.com"

  def email_recommender(params)
    @user = params[:user]
    @base_url = 'http://0.0.0.0:3000/letter_of_recommendation/edit/'
    @url_suffix = params[:url].to_s
    @email = params[:email]
    mail(to: @email, subject: 'Request for Letter of Recommendation')
  end
end
