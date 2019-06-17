require 'rails_helper'

RSpec.describe User, type: :model do
  valid_inputs = {
    email:'lmao@gmail.com',
    password:'lmao',
    password_confirmation: 'lmao',
    first_name: 'lm',
    last_name: 'ao'
  }
  describe 'Validations' do
    it 'is valid with valid inputs' do
      user = User.create(valid_inputs)
      expect(user).to be_valid
    end

    it 'is invalid without email' do
      user = User.create(**valid_inputs, email: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid without password' do
      user = User.create(**valid_inputs, password: nil)
      expect(user).to_not be_valid
    end
    it 'is invalid without password_confirmation' do
      user = User.create(**valid_inputs, password_confirmation: nil)
      expect(user).to_not be_valid
    end
    it 'is invalid without first_name' do
      user = User.create(**valid_inputs, first_name: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid without last_name_name' do
      user = User.create(**valid_inputs, last_name: nil)
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it 'returns false on bad credentials' do
      user = User.create(**valid_inputs)
      is_auth = User.authenticate_with_credentials('lmao@gmail.com', 'wrong_pw')
      expect(is_auth).to be false
    end

    it 'returns true on good credentials' do
      user = User.create(**valid_inputs)
      is_auth = User.authenticate_with_credentials('lmao@gmail.com', 'lmao')
      expect(is_auth).to be true
    end

    it 'returns true on good credentials with extraneous whitespace' do
      user = User.create(**valid_inputs)
      is_auth = User.authenticate_with_credentials('  lmao@gmail.com ', ' lmao ')
      expect(is_auth).to be true
    end

    it 'email is not case sensitive' do
      user = User.create(**valid_inputs)
      is_auth = User.authenticate_with_credentials('LMAO@gmail.com', ' lmao ')
      expect(is_auth).to be true
    end
  end
end
