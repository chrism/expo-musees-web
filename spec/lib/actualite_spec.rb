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
end