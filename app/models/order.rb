class Order < ApplicationRecord
  belongs_to :user
  belongs_to :vendor
  has_one :payment


  validates :name, presence:true
  validates :price, numericality: {greater_than: 0},
  format: { :with => /\A\d+(?:\.\d{0,2})?\z/ } # 2 decimal max
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :city, presence:true
  
end
