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

    it 'shows the Log in button' do
        visit user_session_path
        expect(page).to have_content('Log in')
    end

    it 'click Log in button without filling in details to give error message' do
        visit user_session_path
        click_on 'Log in'
        expect(page).to have_content('Invalid Email or password')
    end

    it 'click Log in button with wrong details to give error message' do
        visit user_session_path
        click_on 'Log in'
        expect(page).to have_content('Invalid Email or password')
    end
  end
end