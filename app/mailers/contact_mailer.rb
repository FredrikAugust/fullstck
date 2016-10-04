# Mailer for responding to a user when he/she contacts and sending the mail to
# us.
class ContactMailer < ApplicationMailer
  default from: 'fullstck@fullstck.io'

  def send_response(email, message)
    @email   = email
    @message = message
    mail(to: 'fullstck@fullstck.io',
         subject: "New message from #{email}")
  end
end
