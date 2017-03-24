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
    render plain: "xXBg7jASuDZGWsMHxgNRQeL1tZZojJi9Jg7QKlJtyrw.yP5gOiIvZLVCU-puVGzZ4XB0iffrBLE97ME_zAn9uYU"
  end
end
