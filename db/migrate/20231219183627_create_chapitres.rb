class CreateChapitres < ActiveRecord::Migration[7.1]
  def change
    create_table :chapitres do |t|
      t.string :titre
      t.integer :numero_chapitre
      t.references :manga, null: false, foreign_key: true

      t.timestamps
    end
  end
end
