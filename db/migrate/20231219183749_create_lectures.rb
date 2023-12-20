class CreateLectures < ActiveRecord::Migration[7.1]
  def change
    create_table :lectures do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chapitre, null: false, foreign_key: true
      t.text :commentaire

      t.timestamps
    end
  end
end
