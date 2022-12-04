class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.item_id :integer
      t.customer_id :integer
      t.amount :integer
      t.timestamps
    end
  end
end
