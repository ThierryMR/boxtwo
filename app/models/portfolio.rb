class Portfolio < ApplicationRecord
  belongs_to :currency
  belongs_to :wallet
end
