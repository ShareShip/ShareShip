class AddForeignkeysToPayments < ActiveRecord::Migration[5.1]
  def change
    add_reference :payments, :from_user_id, :integer, index:true, foreign_key: true
    add_reference :payments, :to_user_id, :integer, index:true, foreign_key: true
  end
end
