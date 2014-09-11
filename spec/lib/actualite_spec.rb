require 'rails_helper'

describe UniteamAPI::Actualite do
  describe '.recent', :vcr do
    before do
      @actualites = UniteamAPI::Actualite.recent
    end

    it 'returns recent actualites from Uniteam API' do
      expect(@actualites).to_not be_empty
    end
  end
end