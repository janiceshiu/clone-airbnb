class ApplicationMailer < ActionMailer::Base
  default from: ENV["test_email"]
  layout 'mailer'
end
