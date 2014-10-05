require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '.add_user' do
    it 'should respond with session if added' do
      response = { PHPSESSID: ''}
      expect(UniteamAPI::User).to receive(:add_user).and_return(response)
      user = User.add_user
      expect(user).to be
    end

    it 'errors if existing user' do
      response = { "error" => 6 }
      expect(UniteamAPI::User).to receive(:add_user).and_return(response)
      expect{ User.add_user }.to raise_error
    end

    it 'errors if problem with the form' do
      response = { "error" => 4 }
      expect(UniteamAPI::User).to receive(:add_user).and_return(response)
      expect{ User.add_user }.to raise_error
    end

    it 'errors if no response at all' do
      response = nil
      expect(UniteamAPI::User).to receive(:add_user).and_return(response)
      expect{ User.add_user }.to raise_error
    end
  end
end