require 'rails_helper'

RSpec.describe Actualite, :type => :model do
  describe '.recent' do
    before do
      actualites = [
        { name: 'news 1', title: 'news title 1' },
        { name: 'news 2', title: 'news title 2' },
        { name: 'news 3', title: 'news title 3' }
      ]
      
      allow(UniteamAPI::Actualite).to receive(:recent).and_return(actualites)

      @recent_actualites = Actualite.recent
    end

    it 'returns recent actualites' do
      expect(@recent_actualites).to have(3).posts
    end

    it 'sets their name' do
      @recent_actualites.each do |actualite|
        expect(actualite.name).to be
      end
    end

    it 'sets their title' do
      @recent_actualites.each do |actualite|
        expect(actualite.title).to be
      end
    end

  end
end
