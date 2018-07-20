class Brand < ActiveRecord::Base
  has_many_and_belongs_to :stores
end
