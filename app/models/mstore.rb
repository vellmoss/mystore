class Mstore < ActiveRecord::Base
  validates_presence_of :position, :price
  validates_uniqueness_of :position
  self.primary_key = "id"
end
