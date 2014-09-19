require 'rails_helper'

RSpec.describe Musee, :type => :model do
  describe '.recent' do
    before do
      count = 3
      items = []
      count.times do |n|
        items << { name: "musee #{n}", uniteam_id: n }
      end
      response = { :items => items }
      expect(UniteamAPI::Musee).to receive(:recent).and_return(response)
      @recent_musees = Musee.recent
    end

    it 'returns recent' do
      expect(@recent_musees[:items]).to have(3).items
    end

  end

  describe '.list' do
    before do
      count = 10
      offset = 0
      items = []
      count.times do |n|
        items << { name: "news #{n}", uniteam_id: "#{n}" }
      end
      response = { :items => items, :total_count => 20, :offset => offset }
      expect(UniteamAPI::Musee).to receive(:list).and_return(response)
      @list = Musee.list
    end

    it 'returns list' do
      expect(@list[:items]).to have(10).items
      expect(@list[:total_count]).to be(20)
    end

    it 'sets their name' do
      @list[:items].each do |item|
        expect(item.name).to be
      end
    end

    it 'sets their uniteam_id' do
      @list[:items].each do |item|
        expect(item.uniteam_id).to be
      end
    end

  end

  describe '.find' do
    before do
      response = { uniteam_id: 1, name: "example name", summary: "example content" }
      expect(UniteamAPI::Musee).to receive(:find).and_return(response)
      @result = Musee.find(1)
    end

    it 'sets their properties' do
      expect(@result.uniteam_id).to eq(1)
      expect(@result.name).to be
      expect(@result.summary).to be
    end
  end
end
