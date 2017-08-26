class Payment < ApplicationRecord
  belongs_to :from, class_name: 'User'
  belongs_to :to, class_name:'User'
  has_one :order
end
