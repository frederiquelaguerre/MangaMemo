class CreateMangas < ActiveRecord::Migration[7.1]
  def change
    create_table :mangas do |t|
      t.string :nom
      t.string :couverture
      t.string :auteur
      t.string :statut
      t.float :note_moyenne

      t.timestamps
    end
  end
end
