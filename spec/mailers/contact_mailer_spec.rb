require 'rails_helper'

RSpec.describe ContactMailer, type: :mailer do
  describe 'contact' do
    let(:email) { 'testuser@example.com' }
    let(:message) { 'This is a random message' }
    let(:mail) { ContactMailer.contact email, message }

    it 'renders the subject' do
      expect(mail.subject).to eql("New message from #{email}")
    end

    it 'renders the sender' do
      expect(mail.from).to eql([email])
    end

    it 'includes the message in the body'do
      expect(mail.body).to match(message)
    end
  end
end
