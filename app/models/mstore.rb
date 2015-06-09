class Mstore < ActiveRecord::Base
  validates_presence_of :position, :price
  validates_uniqueness_of :position
  validates :price, numericality: {less_than: 1000, message: "Не больше 1000!"}
  self.primary_key = "id"
end
