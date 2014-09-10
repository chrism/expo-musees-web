class Actualite < ActiveRecord::Base
  def self.recent
    actualites = UniteamAPI::Actualite.recent
    actualites.collect do |actualite|
      new actualite
    end
  end

  attr_accessor :name, :title

  def initialize(attributes)
    self.name = attributes[:name]
    self.title = attributes[:title]
  end
end
