class Order < ApplicationRecord
  belongs_to :user
  belongs_to :vendor

  has_one :payment
end
