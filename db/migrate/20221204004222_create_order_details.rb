class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.order_id :integer
      t.item_id :integer
      t.price :integer
      t.amount :integer
      t.making_status :integer, default:0
      t.timestamps
    end
  end
end
