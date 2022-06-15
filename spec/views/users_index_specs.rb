require 'rails_helper'

RSpec.describe 'Index page', type: :system, js: true do
    before :each do
        User.create(id: 35, name: 'Richman', bio: 'hello there', photo: 'none',
                password: 'qwertyuiop', email: 'richman@gmail.com', posts_counter: 4, confirmed_at: Time.now)
        visit new_user_session_path
        sleep(2)
        fill_in 'Email', with: 'richman@gmail.com'
        sleep(2)
        fill_in 'Password', with: 'qwertyuiop'
        sleep(2)
        click_button("Log in")
        sleep(2)
    end

    describe 'index page for list users' do
        it 'I can see the username of all other users.' do
          expect(page).to have_content('Richman')
        end
    end

end