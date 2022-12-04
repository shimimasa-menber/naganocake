class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.cunstomer_id :integer
      t.postal_code :string
      t.address :string
      t.name :string
      t.shopping_cost :integer
      t.total_payment :integer
      t.payment_method :integer, default:0
      t.status :integer, default:0
      t.timestamps
    end
  end
end
