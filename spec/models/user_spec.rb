require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Food index' do
    let(:u1) do
      User.create(id: 50,
                  name: 'test-name',
                  email: 'test@useremail.com',
                  password: '123456')
    end

    it 'validate name' do
      expect(u1.name).to eq('test-name')
    end

    it 'validate email' do
      expect(u1.email).to eq('test@useremail.com')
    end

    it 'validate user' do
      expect(u1).to be_valid
    end
  end
end
