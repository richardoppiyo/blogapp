require 'rails_helper'

RSpec.describe 'Sign in page', type: :system do
  describe 'Sign in page' do
    it 'shows the username field' do
      visit user_session_path
      expect(page).to have_content('Email')
    end

    it 'shows the Password field' do
        visit user_session_path
        expect(page).to have_content('Password')
    end

  end
end