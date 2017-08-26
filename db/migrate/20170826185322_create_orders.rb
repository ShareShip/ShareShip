class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :vendor, foreign_key: true
      t.string :name, default: ""
      t.decimal :price, default: 0
      t.integer :quantity, default: 0
      t.datetime :date
      t.string :city, default: ""

      t.timestamps
    end
  end
end
