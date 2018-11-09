class Wallet < ApplicationRecord
  belongs_to :user
  belongs_to :currency

  has_many :offers, dependent: :destroy
  validates_uniqueness_of :currency_id, :scope => :user_id
end
