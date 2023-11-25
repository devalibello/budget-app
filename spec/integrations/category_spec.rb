require 'rails_helper'

RSpec.describe 'User Integration', type: :system do
  let(:user) { User.create(name: 'example_user', email: 'user@example.com', password: 'password') }
  let!(:category) { Category.create(name: 'Nike', icon: 'https://cdn.iconscout.com/icon/free/png-512/free-nike-5-202658.png?f=webp&w=256', author: user) }

  it 'user logs in successfully' do
    sign_in user
    visit categories_path
    sleep(5)
    expect(page).to have_content('CATEGORY')
  end

  it 'display user category' do
    sign_in user
    visit categories_path
    sleep(5)
    expect(page).to have_content('Nike')
  end
end
