class Product < ActiveRecord::Base
  attr_accessible :cost, :name,:image_url,:description

  before_save :create_img
  belongs_to :categroy
  belongs_to :cart
 
  validates :name, presence: true,  uniqueness: { case_sensitive: false }
  validates :cost, presence: true


def create_img
	self.description="Mo ta san pham #{self.name}@railstutorial.org Mo ta san pham #{self.name}@railstutorial.orgMo ta san pham #{self.name}@railstutorial.orgMo ta san pham #{self.name}@railstutorial.orgMo ta san pham #{self.name}@railstutorial.orgMo ta san pham #{self.name}@railstutorial.orgMo ta san pham #{self.name}@railstutorial.orgMo ta san pham #{self.name}@railstutorial.orgMo ta san pham #{self.name}@railstutorial.org"
	
end
  
end
