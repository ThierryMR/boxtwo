require "open-uri"
require 'json'

class Currency < ApplicationRecord
  has_many :wallets, dependent: :destroy

  def self.refresh
    url = 'https://api.coinmarketcap.com/v2/ticker/?limit=12'
    read = open(url).read
    hash = JSON.parse(read)

    hash['data'].each do |key, value|

      coin = Currency.find_or_create_by(website_slug: value['website_slug'])

      coin.name = value['name']
      coin.symbol = value['symbol']
      coin.website_slug = value['website_slug']
      coin.rank = value['rank']
      coin.circulating_supply = value['circulating_supply']
      coin.total_supply = value['total_supply']
      coin.max_supply = value['max_supply'].nil? ? 0 : value['max_supply']

      coin.current_price = value['quotes']['USD']['price']
      coin.volume_24h = value['quotes']['USD']['volume_24h']
      coin.market_cap = value['quotes']['USD']['market_cap']
      coin.percent_change_1h = value['quotes']['USD']['percent_change_1h']
      coin.percent_change_24h = value['quotes']['USD']['percent_change_24h']
      coin.percent_change_7d = value['quotes']['USD']['percent_change_7d']
      coin.save
    end

  end

end
