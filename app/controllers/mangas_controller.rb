class MangasController < ApplicationController
  def index
    @mangas = Manga.all

    if params[:query].present?
      sql_subquery= <<~SQL
        nom ILIKE :query
        OR auteur ILIKE :query
        OR synopsys ILIKE :query
        OR statut ILIKE :query
      SQL
      @mangas = Manga.where(sql_subquery, query: "%#{params[:query]}%")
    else
      @mangas = Manga.all
    end
  end

  def show
    @manga = Manga.find(params[:id])
    @chapitres = @manga.chapitres
  end
end
