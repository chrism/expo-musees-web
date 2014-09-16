require 'rails_helper'

describe UniteamAPI::Actualite do
  describe '.recent', :vcr do
    before do
      @actualites = UniteamAPI::Actualite.recent(3)
    end

    it 'returns recent actualites from Uniteam API' do
      expect(@actualites[:items]).to_not be_empty
      expect(@actualites[:total_count]).to be > 0
    end
  end

  describe '.list', :vcr do
    it 'returns 10 most recent actualites from Uniteam API by default' do
      @actualites = UniteamAPI::Actualite.list
      expect(@actualites[:items]).to have(10).items
      expect(@actualites[:total_count]).to be > 0
    end

    it 'returns 5 most recent actualites from Uniteam API' do
      @actualites = UniteamAPI::Actualite.list(5)
      expect(@actualites[:items]).to have(5).items
      expect(@actualites[:total_count]).to be > 0
    end

    it 'returns 5 recent actualites offset by 5 from Uniteam API' do
      @actualites = UniteamAPI::Actualite.list(5, 5)
      expect(@actualites[:items]).to have(5).items
      expect(@actualites[:total_count]).to be > 0
      expect(@actualites[:offset]).to be(5)
    end
  end

  describe '.find', :vcr do

    it 'returns the full actualite details' do
      @actualite = UniteamAPI::Actualite.find(1)
      expect(@actualite[:uniteam_id]).to eq(1)
      expect(@actualite[:name]).to be
      expect(@actualite[:title]).to be
      expect(@actualite[:content]).to be
    end

  end
end