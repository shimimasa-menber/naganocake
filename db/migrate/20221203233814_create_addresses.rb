class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.customer_id :integer
      t.name :string
      t.postal_code :string
      t.address :string
      t.timestamps
    end
  end
end
