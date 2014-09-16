class ActualitesController < ApplicationController

  before_action :set_actualite, only: [:show, :edit, :update, :destroy]

  def index
    @list_actualites = Actualite.list(10)
  end

  def show
  end

  private
    def set_actualite
      @actualite = Actualite.find(params[:id])
    end

    def actualite_params
      params.require(:actualite).permit(:title, :name, :uniteam_id, :content)
    end
end
