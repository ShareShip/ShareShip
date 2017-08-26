class Payment < ApplicationRecord
  has_one :from, class_name: 'User', foreign_key: :from_user_id
  has_one :to, class_name:'User', foreign_key: :to_user_id
end
