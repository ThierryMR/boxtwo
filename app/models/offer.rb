class Offer < ApplicationRecord
  belongs_to :wallet
  has_one :trade, dependent: :destroy
end
# offers.wallet.currency.name
