require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'It must be created with a password and password_confirmation fields' do
    it 'password should match password confirmation' do
      @user = User.new
      @user.password = '123'
      @user.password_confirmation = '123'
      
      expect(@user.password).to eq (@user.password_confirmation)
    end

    it 'password should not match password confirmation' do
      @user = User.new
      @user.password = '123'
      @user.password_confirmation = '234'
      
      expect(@user.password).not_to eq (@user.password_confirmation)
    end

    it 'password must be presence' do
      @user = User.new
      @user.password = '123'
      expect(@user.password).to be_present
    end

    it 'password confirmation must be presence' do
      @user = User.new
      @user.password_confirmation = '234'
      expect(@user.password_confirmation).to be_present
    end
  end

  describe 'Emails must be unique' do
    it 'and not case sensitive', :focus do
      @user = User.new(email: "user@email.COM")
      @user1 = User.new(email: "user@email.com")
      expect(@user1).to_not be_valid
    end
  end

  describe 'Email, name should also be required' do
    it "is not valid without a email", :focus do
      @user = User.new(email: nil)
      expect(@user).to_not be_valid
    end

    it "is not valid without a name", :focus do
      @user = User.new(name: nil)
      expect(@user).to_not be_valid
    end

  end
end
