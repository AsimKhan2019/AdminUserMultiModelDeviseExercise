class Account < ApplicationRecord
  belongs_to :subscription
  has_one :admin
  has_many :users
end
