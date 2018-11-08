class Offer < ApplicationRecord
  belongs_to :wallet
  has_one :trade, :class_name => "Transaction"
end
