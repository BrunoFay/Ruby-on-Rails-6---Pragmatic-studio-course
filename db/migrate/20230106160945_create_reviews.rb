class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.integer :stars
      t.text :comment
      t.string :text
      t.references :film, null: false, foreign_key: true

      t.timestamps
    end
  end
end
