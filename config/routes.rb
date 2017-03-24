Rails.application.routes.draw do
  root '/', controller: :static_page, action: :index

  post '/contact', controller: :static_page, action: :contact
end
