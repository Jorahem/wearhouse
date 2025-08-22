class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :category, null: false, foreign_key: true
      t.string :size
      t.string :color
      t.string :image_url
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
