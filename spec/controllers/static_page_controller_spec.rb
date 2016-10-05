require 'rails_helper'

RSpec.describe StaticPageController, type: :controller do
  before { ActionMailer::Base.deliveries = [] }

  describe 'GET index' do
    it 'renders the page' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST contact' do
    it 'sends an email if valid params' do
      post :contact, params: {
        email: 'example@example.com',
        message: 'This is a test!'
      }

      expect(ActionMailer::Base.deliveries.count).to eql 1
      expect(ActionMailer::Base.deliveries.first.from).to eql\
        ['example@example.com']
      expect(ActionMailer::Base.deliveries.first.body).to\
        match(/This is a test!/)
    end

    it "doesn't send an email if the user sends in no email" do
      post :contact, params: {
        email: '',
        message: 'Ooopsie!'
      }

      expect(ActionMailer::Base.deliveries.count).to eql 0
    end

    it "doesn't send an email if the user sends in no message" do
      post :contact, params: {
        email: 'example@example.com',
        message: ''
      }

      expect(ActionMailer::Base.deliveries.count).to eql 0
    end
  end
end
