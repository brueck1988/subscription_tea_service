class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription
  has_many :subscription_teas, through: :subscription
  has_many :teas, through: :subscription_teas
end