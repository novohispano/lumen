require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has attributes' do
    result = User.create(email: 'jorge@example.com')

    expect(result.email).to eq 'jorge@example.com'
  end


  describe 'password validation' do
    it 'has a secure password' do
      password = 'password'
      result   = User.create(
        email:                 'jorge@example.com',
        password:              password,
        password_confirmation: password
        )

      expect(result.authenticate(password)).to eq result
    end

    it 'validates password validation' do
      result = User.create(email: 'jorge@example.com')

      expect(result).not_to be_valid
    end

    it 'validates password confirmation' do
      result = User.create(
        email:                 'jorge@example.com',
        password:              'password',
        password_confirmation: 'other_password'
        )

      expect(result).not_to be_valid
    end
  end

  describe 'email validation' do
    it 'validates email presence' do
      result = User.create(
        password:              'password',
        password_confirmation: 'password'
        )

      expect(result).not_to be_valid
    end

    it 'validates email uniqueness' do
      User.create(
        email:                 'jorge@example.com',
        password:              'password',
        password_confirmation: 'password'
        )

      result = User.create(
        email:                 'jorge@example.com',
        password:              'password',
        password_confirmation: 'password'
        )

      expect(result).not_to be_valid
    end
  end
end
