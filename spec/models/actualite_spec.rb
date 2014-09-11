require 'rails_helper'

RSpec.describe Actualite, :type => :model do
  describe '.recent' do
    before do
      items = [
        { name: 'news 1', title: 'news title 1' },
        { name: 'news 2', title: 'news title 2' },
        { name: 'news 3', title: 'news title 3' }
      ]
      total_count = 3
      response = { :items => items, :total_count => total_count }
      expect(UniteamAPI::Actualite).to receive(:recent).and_return(response)
      @recent_actualites = Actualite.recent
    end

    it 'returns recent actualites' do
      expect(@recent_actualites[:items]).to have(3).items
      expect(@recent_actualites[:total_count]).to be(3)
    end

    it 'sets their name' do
      @recent_actualites[:items].each do |actualite|
        expect(actualite.name).to be
      end
    end

    it 'sets their title' do
      @recent_actualites[:items].each do |actualite|
        expect(actualite.title).to be
      end
    end

  end
end
