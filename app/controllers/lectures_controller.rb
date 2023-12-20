class LecturesController < ApplicationController
  def create
    @manga = Manga.find(params[:manga_id])
    @chapitre = Chapitre.find(params[:chapitre_id])
    @lecture = Lecture.new(user: current_user, chapitre: @chapitre)
    if @lecture.save
      redirect_to manga_chapitre_path(@manga, @chapitre)
    else
      render 'chapitres/show'
    end
  end

  def destroy
  end

  # app/controllers/lectures_controller.rb
class LecturesController < ApplicationController
  def mark_as_read
    chapitre_id = params[:chapitre_id]
    current_user.lectures.find_or_create_by(chapitre_id: chapitre_id).update(lu: true)
    redirect_back fallback_location: root_path
  end

  def mark_as_unread
    chapitre_id = params[:chapitre_id]
    current_user.lectures.find_or_create_by(chapitre_id: chapitre_id).update(lu: false)
    redirect_back fallback_location: root_path
  end
end

end
