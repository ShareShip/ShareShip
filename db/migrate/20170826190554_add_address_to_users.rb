class AddAddressToUsers < ActiveRecord::Migration[5.1]
  def change
<<<<<<< HEAD
    add_column :users, :address, :string
    add_column :users, :city, :string
=======
    add_column :users, :address_line_1, :string, default: ""
    add_column :users, :address_line_2, :string, default: ""
    add_column :users, :city, :string, default: ""
    add_column :users, :state, :string, default: ""
    add_column :users, :zip, :string, default: ""
    add_column :users, :phone, :string, default: ""

>>>>>>> master
  end
end
