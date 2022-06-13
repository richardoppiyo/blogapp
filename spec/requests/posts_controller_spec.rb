require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before :each do
    get '/users/:id/posts'
  end

  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    expect(response).to render_template('index')
  end
  it 'correct body info index page' do
    expect(response.body).to include('The Users List')
  end
end

RSpec.describe 'Posts', type: :request do
  before :each do
    get '/users/:id/posts/:id'
  end

  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end
  it "renders 'show' template" do
    expect(response).to render_template('show')
  end
  it 'correct body info show page' do
    expect(response.body).to include('Here is a User')
  end
end
