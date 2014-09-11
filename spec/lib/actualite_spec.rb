require 'rails_helper'

describe UniteamAPI::Actualite do
  describe '.recent', :vcr, record: :all do
    before do
      @actualites = UniteamAPI::Actualite.recent(3)
    end

    it 'returns recent actualites from Uniteam API' do
      expect(@actualites[:items]).to_not be_empty
      expect(@actualites[:total_count]).to be > 0
    end
  end

  describe '.list', :vcr, record: :all do
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
end