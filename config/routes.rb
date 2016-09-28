Rails.application.routes.draw do
  root '/', controller: :static_page, action: :index
  get '/.well-known/acme-challenge/:id' => 'static_page#letsencrypt'
end
