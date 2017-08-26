class Payment < ApplicationRecord
  belongs_to :from, class_name: 'User'
  belongs_to :to, class_name:'User'
  has_one :order

  validates :price, numericality: {greater_than: 0},
  format: { :with => /\A\d+(?:\.\d{0,2})?\z/ } # 2 decimal max
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :fee, numericality: {greater_than: 0},
  format: { :with => /\A\d+(?:\.\d{0,2})?\z/ } # 2 decimal max

end
