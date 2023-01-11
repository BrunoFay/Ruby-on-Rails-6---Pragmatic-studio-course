class RemoveImageFileNameFromFilms < ActiveRecord::Migration[6.1]
  def change
    remove_column :films, :image_file_name, :string
  end
end
