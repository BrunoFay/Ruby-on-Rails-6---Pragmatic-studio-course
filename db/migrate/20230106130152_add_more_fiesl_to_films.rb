class AddMoreFieslToFilms < ActiveRecord::Migration[6.1]
  def change
    add_column :films, :director, :string
    add_column :films, :duration, :string
    add_column :films, :image_file_name, :string, default: "placeholder.png"
  end
end
