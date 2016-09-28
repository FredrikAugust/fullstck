Rails.application.routes.draw do
  root '/', controller: :static_page, action: :index
end
