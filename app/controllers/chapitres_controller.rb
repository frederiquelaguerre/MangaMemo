class ChapitresController < ApplicationController
  def mark_as_read
    @chapitre = Chapitre.find(params[:id])
    @manga = @chapitre.manga
    @manga.update(lu_chapitres: @manga.lu_chapitres + [@chapitre.numero])
    respond_to do |format|
      format.js
    end
  end

end
