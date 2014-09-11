class Actualite < ActiveRecord::Base
  attr_accessor :name, :title

  def initialize(attributes)
    self.name = attributes[:name]
    self.title = attributes[:title]
  end

  def self.recent(count = 3)
    actualites = UniteamAPI::Actualite.recent(count)

    total_count  = actualites[:total_count]
    items = actualites[:items].collect do |actualite|
      new actualite
    end

    { :items => items, :total_count => total_count }

  end
end