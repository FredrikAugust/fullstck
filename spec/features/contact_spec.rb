require 'rails_helper'

RSpec.feature 'Contact', type: :feature, js: true do
  # simple method to send an email with specified values
  def send_test_email(email='example@example.com', message='This is a test!')
    visit root_path

    fill_in 'email', with: email
    fill_in 'message', with: message

    click_button 'Submit'
  end

  before { ActionMailer::Base.deliveries = [] }

  scenario 'user can send mail if correctly filled out' do
    send_test_email

    expect(ActionMailer::Base.deliveries.count).to eql 1
    expect(ActionMailer::Base.deliveries.first.from).to eql\
      ['example@example.com']
    expect(ActionMailer::Base.deliveries.first.body).to match(/This is a test!/)
  end

  scenario 'toast is shown after successful contact' do
    send_test_email

    expect(page).to have_css '.toast'
  end

  scenario 'user tries to contact us but forgets email' do
    # cheeky-breeky way to check that the submit button is disabled
    expect do
      send_test_email(email: '')
    end.to raise_error Capybara::ElementNotFound

    # double-check that the button is disabled
    expect(page).to have_css('#submit[disabled]')
    expect(ActionMailer::Base.deliveries.count).to eql 0
  end

  scenario 'user tries to contact us but forgets message' do
    # cheeky-breeky way to check that the submit button is disabled
    expect do
      send_test_email(message: '')
    end.to raise_error Capybara::ElementNotFound

    # double-check that the button is disabled
    expect(page).to have_css('#submit[disabled]')
    expect(ActionMailer::Base.deliveries.count).to eql 0
  end
end
