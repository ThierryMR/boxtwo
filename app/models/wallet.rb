class Wallet < ApplicationRecord
  belongs_to :user
  belongs_to :currency
  has_many :offers
end
