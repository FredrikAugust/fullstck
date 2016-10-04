# Mailer for responding to a user when he/she contacts and sending the mail to
# us.
class ContactMailer < ApplicationMailer
  def contact(email, message)
    @email   = email
    @message = message
    mail(to: 'fullstck@fullstck.io',
         subject: "New message from #{email}",
         from: email)
  end
end
