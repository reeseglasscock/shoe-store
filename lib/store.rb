class Store < ActiveRecord::Base
  attr_accessor :store
  has_and_belongs_to_many :brands
  before_validation :normalize_name, on: :create
  validates(:store, {:presence => true, uniqueness: { case_sensitive: false }, :length => {:maximum => 100}})

  private
    def normalize_name
      self.store = store.downcase.titleize
    end
end
