class StaticPageController < ApplicationController
  def index
  end

  def letsencrypt
    render text: 'iIG6CevEY-FZQVjjPfPa8dZxOQ9gdujY55VEt9FWHuw.2-E9DzzYma7wPTE0h0Brc5A8hj4wXic-n7sgJg6Tv_w'
  end
end
