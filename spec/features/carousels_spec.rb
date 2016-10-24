require 'rails_helper'

RSpec.feature 'Carousels', type: :feature, js: true do
  before do
    visit root_path
  end
end
