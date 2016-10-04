# Mailer for responding to a user when he/she contacts and sending the mail to
# us.
class ContactMailer < ApplicationMailer
  def contact(email, message)
    @email   = email
    @message = message
    mail(to: 'contact@fullstck.io',
         subject: 'New message from fullstck.io',
         from: email)
  end
end
