class Musee < ActiveRecord::Base
  attr_accessor :name, :title, :uniteam_id, :summary, :image_url, :latitude, :longtitude, :address, :city, :country, :zip_code, :video, :ticketnet_url, :wikipedia_url, :opening_hours, :cost, :rating

  def initialize(attributes)
    self.name = attributes[:name]
    self.title = attributes[:title]
    self.uniteam_id = attributes[:uniteam_id]
    self.summary = attributes[:summary]
    self.image_url = attributes[:image_url]
    self.latitude = attributes[:latitude]
    self.longtitude = attributes[:longtitude]
    self.address = attributes[:address]
    self.city = attributes[:city]
    self.country = "France"
    self.zip_code = attributes[:zip_code]
    self.video = attributes[:video]
    self.ticketnet_url = attributes[:ticketnet_url]
    self.wikipedia_url = attributes[:wikipedia_url]
    self.opening_hours = attributes[:opening_hours]
    self.cost = attributes[:cost]
    self.rating = attributes[:rating]
  end

  def self.recent(count = 3)
    musees = UniteamAPI::Musee.recent(count)
    total_count  = musees[:total_count]
    items = musees[:items].collect do |musee|
      new musee
    end
    { :items => items, :total_count => total_count }
  end

  def self.list(count = 10, offset = 0)
    musees = UniteamAPI::Musee.list(count, offset)
    total_count  = musees[:total_count]
    offset = musees[:offset]
    count = musees[:count]
    items = musees[:items].collect do |musee|
      new musee
    end
    { :items => items, :total_count => total_count, :offset => offset, :count => count }
  end

  def self.find(id)
    musee = UniteamAPI::Musee.find(id)
    new musee
  end
  
end