class Actualite < ActiveRecord::Base
  attr_accessor :name, :title, :uniteam_id, :content, :date, :image_url

  def initialize(attributes)
    self.name = attributes[:name]
    self.title = attributes[:title]
    self.uniteam_id = attributes[:uniteam_id]
    self.content = attributes[:content]
    self.date = attributes[:date]
    self.image_url = attributes[:image_url]
  end

  def self.recent(count = 3)
    list(count)
  end

  def self.list(count = 10, offset = 0)
    actualites = UniteamAPI::Actualite.list(count, offset)
    total_count  = actualites[:total_count]
    offset = actualites[:offset]
    count = actualites[:count]
    items = actualites[:items].collect do |actualite|
      new actualite
    end
    { :items => items, :total_count => total_count, :offset => offset, :count => count }
  end

  def self.find(id)
    actualite = UniteamAPI::Actualite.find(id)
    new actualite
  end
  
end