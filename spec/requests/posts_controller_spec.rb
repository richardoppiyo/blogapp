require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    get '/users/:id/posts'
  end

  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    expect(response).to render_template('index')
  end
  it 'correct body info' do
    expect(response.body).to include('This is a new post to a given user')
  end
end
