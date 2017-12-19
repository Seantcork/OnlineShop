class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.integer :amount
      t.string :fruit
      t.float :price
      t.string :name

      t.timestamps
    end
  end
end
