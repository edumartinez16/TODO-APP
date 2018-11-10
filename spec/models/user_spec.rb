require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(email: email,
    password: 'foobar', password_confirmation: 'foobar')
  end
  let(:email) { 'user@example.com' }
  # before do
  #   @user.avatar.attach(io: File.open('app/assets/images/default-user.png'),
  #       filename: 'default.png', content_type: 'image/png')
  # end
  context 'when the user has all his data valid' do
    it 'should be valid' do
      expect(user).to be_valid
    end
  end
  context 'when the user has an invalid email' do
    let(:email) { '' }
    it 'is invalid' do
      expect(user).not_to be_valid
    end
  end

  context 'when the user email is longer than 50 characters' do
    let(:email) { 'x' * 45 + '@example.com' }
    it 'is invalid' do
      expect(user).not_to be_valid
    end
  end
  context 'when the user is created'

  # it 'email validation should reject invalid addresses' do
  #   invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
  #   invalid_addresses.each do |invalid_address|
  #     @user.email = invalid_address
  #     expect(@user).not_to be_valid
  #   end
  # end
end
