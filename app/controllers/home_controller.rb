class HomeController < ApplicationController
  def index
    @recent_actualites = Actualite.recent(3)
  end
end
