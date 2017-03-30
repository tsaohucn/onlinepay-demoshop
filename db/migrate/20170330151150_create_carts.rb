class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :title
      t.integer :price
      t.integer :stock
      t.timestamps
    end
  end
end
