class Offer < ApplicationRecord
  belongs_to :wallet
  has_one :trade, :class_name => "Transaction", foreign_key: "trader_id"
  # scope :offers_by_currency, -> (currency_name) { where wallet: wallet_id }
end
# offers.wallet.currency.name
