class MuseesController < ApplicationController
  before_action :set_musee, only: [:show, :edit, :update, :destroy]

  def index
    page = params[:page].to_i
    per_page = 10
    offset = page * per_page
    @list_musees = Musee.list(per_page, offset)
    @pagination = Kaminari.paginate_array(
      @list_musees[:items],
      total_count: @list_musees[:total_count]
      ).page(params[:page]).per(per_page)
  end

  def show
  end

  private
    def set_musee
      @musee = Musee.find(params[:id])
    end
end
