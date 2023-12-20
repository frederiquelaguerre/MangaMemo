class AddLuToLectures < ActiveRecord::Migration[7.1]
  def change
    add_column :lectures, :lu, :boolean
  end
end
