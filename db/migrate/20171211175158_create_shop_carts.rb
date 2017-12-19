class CreateShopCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_carts do |t|
      t.integer :amount
      t.string :fuirt
      t.float :price

      t.timestamps
    end
  end
end
