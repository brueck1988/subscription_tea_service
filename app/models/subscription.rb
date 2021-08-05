class Subscription < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status
  validates_presence_of :frequency
  
  validates_numericality_of :price
  validates_numericality_of :frequency
end
