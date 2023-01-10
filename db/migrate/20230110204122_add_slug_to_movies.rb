class AddSlugToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :films, :slug, :string
  end
end
