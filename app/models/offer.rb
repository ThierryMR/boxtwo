class Offer < ApplicationRecord
  belongs_to :wallet
  has_one :trade, :class_name => "Transaction", foreign_key: "trader_id"
end
