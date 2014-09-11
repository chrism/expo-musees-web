class ActualitesController < ApplicationController
  def index
    @recent_actualites = Actualite.recent(10)
  end
end
