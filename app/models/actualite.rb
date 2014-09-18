class Actualite < ActiveRecord::Base
  attr_accessor :name, :title, :uniteam_id, :content, :date

  def initialize(attributes)
    self.name = attributes[:name]
    self.title = attributes[:title]
    self.uniteam_id = attributes[:uniteam_id]
    self.content = attributes[:content]
    self.date = attributes[:date]
  end

  def self.recent(count = 3)
    actualites = UniteamAPI::Actualite.recent(count)
    total_count  = actualites[:total_count]
    items = actualites[:items].collect do |actualite|
      new actualite
    end
    { :items => items, :total_count => total_count }
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