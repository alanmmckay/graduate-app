class ApplicationMailer < ActionMailer::Base
  default from: "notifications@graduate.application.com"
  layout 'mailer'
end
