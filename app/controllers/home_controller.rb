class HomeController < ApplicationController
  def index
    @list_actualites = Actualite.find(100)
    debugger
  end
end
