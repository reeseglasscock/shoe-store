class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  before_validation :normalize_name, on: :create
  validates(:shoe_brand, {:presence => true, :length => {:maximum => 100}, uniqueness: { case_sensitive: false }})
  validates(:price, {:presence => true})

  private
    def normalize_name
      self.shoe_brand = shoe_brand.downcase.titleize
    end
end
