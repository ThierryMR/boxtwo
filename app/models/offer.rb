class Offer < ApplicationRecord
  belongs_to :wallet
  has_one :trade
end
# offers.wallet.currency.name
