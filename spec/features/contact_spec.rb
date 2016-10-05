require 'rails_helper'

RSpec.feature 'Contact', type: :feature, js: true do
  before { ActionMailer::Base.deliveries = [] }

  scenario 'user tries to contact us' do
    visit root_path

    fill_in 'email', with: 'example@example.com'
    fill_in 'message', with: 'This is a test!'

    click_button 'Submit'

    expect(ActionMailer::Base.deliveries.count).to eql 1
    expect(ActionMailer::Base.deliveries.first.from).to eql\
      ['example@example.com']
    expect(ActionMailer::Base.deliveries.first.body).to match(/This is a test!/)
  end

  scenario 'user tries to contact us but forgets email' do
    visit root_path

    fill_in 'message', with: 'Oh snap! Looks like forgot the email'

    # cheeky-breeky way to check that the submit button is disabled
    expect { click_button 'Submit' }.to raise_error Capybara::ElementNotFound
    # double-check that the button is disabled
    expect(page).to have_css('#submit[disabled]')
    expect(ActionMailer::Base.deliveries.count).to eql 0
  end

  scenario 'user tries to contact us but forgets message' do
    visit root_path

    fill_in 'email', with: 'example@example.com'

    # cheeky-breeky way to check that the submit button is disabled
    expect { click_button 'Submit' }.to raise_error Capybara::ElementNotFound
    # double-check that the button is disabled
    expect(page).to have_css('#submit[disabled]')
    expect(ActionMailer::Base.deliveries.count).to eql 0
  end
end
