class AddSynopsysToMangas < ActiveRecord::Migration[7.1]
  def change
    add_column :mangas, :synopsys, :text

  end
end
