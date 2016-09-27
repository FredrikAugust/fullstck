require 'rails_helper'

RSpec.describe StaticPageController, type: :controller do
  describe 'GET index' do
    it 'renders the page' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
