class AddPriceToFilms < ActiveRecord::Migration[6.1]
  def change
    add_column :films, :price, :float
  end
end
