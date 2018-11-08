class Wallet < ApplicationRecord
  belongs_to :user
  belongs_to :currency

  has_many :offers, dependent: :destroy
  validates :currency_id, uniqueness: true
end
