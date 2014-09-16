require 'rails_helper'

RSpec.describe Actualite, :type => :model do
  describe '.recent' do
    before do
      count = 3
      items = []
      count.times do |n|
        items << { name: "news #{n}", title: "news title #{n}", uniteam_id: n }
      end
      response = { :items => items }
      expect(UniteamAPI::Actualite).to receive(:recent).and_return(response)
      @recent_actualites = Actualite.recent
    end

    it 'returns recent actualites' do
      expect(@recent_actualites[:items]).to have(3).items
    end

  end

  describe '.list' do
    before do
      count = 10
      offset = 0
      items = []
      count.times do |n|
        items << { name: "news #{n}", title: "news title #{n}", uniteam_id: "#{n}" }
      end
      response = { :items => items, :total_count => 20, :offset => offset }
      expect(UniteamAPI::Actualite).to receive(:list).and_return(response)
      @list_actualites = Actualite.list
    end

    it 'returns list of actualites' do
      expect(@list_actualites[:items]).to have(10).items
      expect(@list_actualites[:total_count]).to be(20)
    end

    it 'sets their name' do
      @list_actualites[:items].each do |actualite|
        expect(actualite.name).to be
      end
    end

    it 'sets their title' do
      @list_actualites[:items].each do |actualite|
        expect(actualite.title).to be
      end
    end

    it 'sets their uniteam_id' do
      @list_actualites[:items].each do |actualite|
        expect(actualite.uniteam_id).to be
      end
    end

  end

  describe '.find' do
    before do
      response = { uniteam_id: 1, title: "example title", name: "example name", content: "example content" }
      expect(UniteamAPI::Actualite).to receive(:find).and_return(response)
      @actualite = Actualite.find(1)
    end

    it 'sets their properties' do
      puts @actualite
      expect(@actualite.uniteam_id).to eq(1)
      expect(@actualite.title).to be
      expect(@actualite.name).to be
      expect(@actualite.content).to be
    end
  end
end
