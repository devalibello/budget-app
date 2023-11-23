require_relative '../rails_helper'

RSpec.describe Category, type: :model do
  before(:example) do
    @user = User.create(name: 'user-1', email: 'user-1@example.com', password: '123456')
  end

  context 'Validations' do
    it 'validates name presence' do
      category = Category.new(author: @user, icon: 'https://cdn.iconscout.com/icon/free/png-512/free-nike-1-202653.png?f=webp&w=256')
      expect(category.valid?).to eq false
    end

    it 'validates presence of icon' do
      category = Category.new(author: @user, name: 'test-name')
      expect(category.valid?).to eq false
    end

    it 'validates name and icon' do
      category = Category.new(author: @user, name: 'test-name', icon: 'https://cdn.iconscout.com/icon/free/png-512/free-nike-5-202658.png?f=webp&w=256')
      expect(category.valid?).to eq true
    end
  end

  context 'Associations' do
    it 'belongs to an author' do
      category = Category.reflect_on_association('author')
      expect(category.macro).to eq(:belongs_to)
    end
  end
end
