require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Category index', type: :request do
  let(:user) do
    User.create(name: 'example_user', email: 'user@example.com', password: 'password')
  end
  let!(:category) do
    Category.create(
      name: 'Food-CAT',
      icon: 'https://cdn.iconscout.com/icon/free/png-512/free-nike-1-202653.png?f=webp&w=256',
      author: user,
      id: 10
    )
  end
  let!(:payment) { Payment.create(name: 'test-name', amount: 10, category_id: category, author: user) }

  describe 'GET /' do
    it 'renders the index page for categories when user is signed in' do
      sign_in user
      get '/categories/10/payments'
      expect(response.status).to eq(200)
    end
  end
end
