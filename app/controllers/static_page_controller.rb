# Mainly controller for the rendering of the index page and sending the contact
# email
class StaticPageController < ApplicationController
  def index
  end

  def contact
    email = params[:email]
    message = params[:message]

    if !email.empty? && !message.empty?
      ContactMailer.contact(email, message).deliver
      redirect_to(root_path, notice: 'Thank you for contacting us. ' \
                                     'We will respond shortly')
    end
  end

  def acme
    render text: '_jVzEyVkoPA_3T3_GM1N5yOvS7kvEryojf8za1EimCs.2-E9DzzYma7wPTE0h0Brc5A8hj4wXic-n7sgJg6Tv_w'
  end
end
