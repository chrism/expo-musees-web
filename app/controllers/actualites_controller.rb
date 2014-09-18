class ActualitesController < ApplicationController

  before_action :set_actualite, only: [:show, :edit, :update, :destroy]

  def index
    page = params[:page].to_i
    per_page = 10
    offset = page * per_page
    @list_actualites = Actualite.list(per_page, offset)
    @pagination = Kaminari.paginate_array(
      @list_actualites[:items],
      total_count: @list_actualites[:total_count]
      ).page(params[:page]).per(per_page)
  end

  def show
  end

  private
    def set_actualite
      @actualite = Actualite.find(params[:id])
    end

    def actualite_params
      params.require(:actualite).permit(:title, :name, :uniteam_id, :content, :date)
    end
end
