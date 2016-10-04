# Settings for the mailer in rails
class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@fullstck.io'
  layout 'mailer'
end
