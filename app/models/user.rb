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
  validates :address_line_1, presence:true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :zip, presence: true


  validates :phone, presence:true, numericality: true, length: {in: 10..15}


  def phone=(val)
    if (val.gsub(/\s+/, "")!="")
      write_attribute(:phone, val.gsub(/\D/, '')[0, 14].to_i)
    end
  end

end
