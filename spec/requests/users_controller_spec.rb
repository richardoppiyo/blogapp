require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    get '/users/'
  end

  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    expect(response).to render_template('index')
  end
  it 'correct body info' do
    expect(response.body).to include('This is the Landing Page to show list of users')
  end
end
