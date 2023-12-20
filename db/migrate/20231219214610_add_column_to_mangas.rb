class AddColumnToMangas < ActiveRecord::Migration[7.1]
  def change
    add_column :mangas , :volume, :integer
    add_column :mangas , :chapitre, :integer
  end
end
