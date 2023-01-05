class AddFildsToFilms < ActiveRecord::Migration[6.1]
  def change
    add_column :films, :released_on, :date
  end
end
