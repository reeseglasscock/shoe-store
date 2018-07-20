class Store < ActiveRecord::Base
  has_many_and_belongs_to :brands
end
