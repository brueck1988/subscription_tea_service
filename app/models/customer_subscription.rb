class CustomerSubscription < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :address
  
  belongs_to :customer
  belongs_to :subscription
end
