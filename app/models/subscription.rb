class Subscription < ApplicationRecord
  has_many :customer_subscriptions, dependent: :destroy
  has_many :customers, through: :customer_subscriptions
  has_many :subscription_teas, dependent: :destroy
  has_many :teas, through: :subscription_teas
  
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status
  validates_presence_of :frequency
  
  validates_numericality_of :price
  validates_numericality_of :frequency
end
