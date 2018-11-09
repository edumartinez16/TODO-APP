require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(email: 'user@example.com',
      password: "foobar", password_confirmation: "foobar")
  end
  it 'should have valid email' do
    @user.email = ''
    expect(@user).not_to be_valid
  end
  it 'email should not be longer than 50 characters' do
    @user.email = 'x' * 45 + '@example.com'
    expect(@user).not_to be_valid
  end
  it 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).not_to be_valid
    end
  end
  it 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user).not_to be_valid
  end
  it 'should be valid' do
    expect(@user).to be_valid
  end
end
