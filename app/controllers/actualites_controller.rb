class ActualitesController < ApplicationController
  def index
    @recent_actualites = Actualite.recent
  end
end
