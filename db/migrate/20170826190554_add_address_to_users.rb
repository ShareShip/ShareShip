class AddAddressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address_line_1, :string, default: ""
    add_column :users, :address_line_2, :string, default: ""
    add_column :users, :city, :string, default: ""
    add_column :users, :state, :string, default: ""
    add_column :users, :zip, :string, default: ""
    add_column :users, :phone, :string, default: ""

  end
end
