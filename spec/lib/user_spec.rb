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


end