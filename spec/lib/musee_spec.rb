require 'rails_helper'

describe UniteamAPI::Musee do
  describe '.recent', :vcr do
    before do
      @actualites = UniteamAPI::Musee.recent(3)
    end

    it 'returns recent museums from Uniteam API' do
      expect(@actualites[:items]).to_not be_empty
      expect(@actualites[:total_count]).to be > 0
    end
  end

  describe '.list', :vcr do
    it 'returns 10 most recent museums from Uniteam API by default' do
      @actualites = UniteamAPI::Musee.list
      expect(@actualites[:items]).to have(10).items
      expect(@actualites[:total_count]).to be > 0
    end

    it 'returns 5 most recent museums from Uniteam API' do
      @actualites = UniteamAPI::Musee.list(5)
      expect(@actualites[:items]).to have(5).items
      expect(@actualites[:total_count]).to be > 0
    end

    it 'returns 5 recent museums offset by 5 from Uniteam API' do
      @actualites = UniteamAPI::Musee.list(5, 5)
      expect(@actualites[:items]).to have(5).items
      expect(@actualites[:total_count]).to be > 0
      expect(@actualites[:offset]).to be(5)
    end
  end

  describe '.find', :vcr do

    it 'returns the full museum details' do
      @actualite = UniteamAPI::Musee.find(1)
      expect(@actualite[:uniteam_id]).to eq(1)
      expect(@actualite[:name]).to be
      expect(@actualite[:title]).to be
      expect(@actualite[:summary]).to be
    end

  end
end