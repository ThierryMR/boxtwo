# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'json'

# url = 'https://api.coinmarketcap.com/v2/ticker/'
url = 'https://api.coinmarketcap.com/v2/ticker/?limit=10'
read = open(url).read
hash = JSON.parse(read)
# p hash

hash['data'].each do |key, value|
  # p key
  coin = Currency.new
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
  # coin.current_trans_volume = value2['volume']
# end
  coin.save
end
