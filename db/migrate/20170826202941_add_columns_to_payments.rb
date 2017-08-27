class AddColumnsToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :from_id, :integer
    add_column :payments, :to_id, :integer
    add_column :payments, :order_id, :integer
    add_column :payments, :price, :decimal, default: 0
    add_column :payments, :quantity, :integer, default: 0
    add_column :payments, :fee, :decimal, default: 0

  end
end
