class Tea < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :temperature
  validates_presence_of :brew_time
  
  validates_numericality_of :temperature
  validates_numericality_of :brew_time

end
