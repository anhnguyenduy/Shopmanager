class Category < ActiveRecord::Base
  attr_accessible :name
  before_save :create_remember_token
  has_many :products, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }

   private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
