class Order < ActiveRecord::Base

  attr_accessible :number_product, :total_price,:phone,:note, :address,:status
  belongs_to :user
  has_many :orderdetails, dependent: :destroy
  validates :phone, presence: true
  validates :address, presence:true
 degex= /(new|deleving|deleved)/i
  validates :status, format:{with: degex}
end
