class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :payments_from, :class_name => 'Payment', :foreign_key => 'from_id'
  has_many :payments_to, :class_name => 'Payment', :foreign_key => 'to_id'
  has_many :orders

  validates :email, uniqueness: true, presence: true
  validates :password, presence:true

end
