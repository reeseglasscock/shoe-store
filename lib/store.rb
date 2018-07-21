class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands
  before_validation :normalize_name, on: :create
  validates(:store, :presence => true)

  private
    def normalize_name
      self.store = store.downcase.titleize
    end
end
