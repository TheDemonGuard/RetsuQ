class ApplicationMailer < ActionMailer::Base
  default from: ENV['SMTP_USERNAME'] # Replace this email address with your own
  layout 'mailer'
end
