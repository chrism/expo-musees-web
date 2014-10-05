require 'rails_helper'

describe UniteamAPI::User do
  describe '.authenticate', :vcr do
    it 'authentication successful' do
      @session_hash = UniteamAPI::User.authenticate(ENV['USERNAME'], ENV['PASSWORD'])
      expect(@session_hash).to be
    end

    it 'authentication error' do
      @session_hash = UniteamAPI::User.authenticate(ENV['USERNAME'], 'password')
      expect(@session_hash).to_not be
    end
  end

  describe '.add_user', :vcr do
    it 'creates a user' do
      user = UniteamAPI::User.add_user(
        Faker::Name.first_name,
        Faker::Name.last_name,
        Faker::Internet.email,
        Faker::Internet.password(8)
      )
      expect(user["PHPSESSID"]).to be
    end

    it 'user already exists' do
      user = UniteamAPI::User.add_user(ENV['FIRSTNAME'], ENV['LASTNAME'], ENV['USERNAME'], ENV['PASSWORD'])
      expect(user["error"]).to be(6)
    end

    it 'invalid form' do
      user = UniteamAPI::User.add_user()
      expect(user["error"]).to be(4)
    end
  end
end