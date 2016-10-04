class StaticPageController < ApplicationController
  def index
  end

  def contact
    email = params[:email]
    message = params[:message]

    if !email.nil? && !message.nil?
      ContactMailer.send_response(email, message)
      redirect_to(root_path, notice: 'Thanks you for contacting us.' +
                                     'We will respond shortly')
    end
  end
end
