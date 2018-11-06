class AddColumnToCurrencies < ActiveRecord::Migration[5.2]
  def change
    add_column :currencies, :symbol, :string
    add_column :currencies, :website_slug, :string
    add_column :currencies, :rank, :integer
    add_column :currencies, :circulating_supply, :float
    add_column :currencies, :total_supply, :float
    add_column :currencies, :max_supply, :float
    add_column :currencies, :volume_24h, :float
    add_column :currencies, :market_cap, :float
    add_column :currencies, :percent_change_1h, :float
    add_column :currencies, :percent_change_24h, :float
    add_column :currencies, :percent_change_7d, :float
  end
end
