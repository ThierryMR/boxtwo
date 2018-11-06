class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name
      t.float :current_price
      t.float :current_trans_volume
      t.float :historical_price
      t.float :historical_trans_volume

      t.timestamps
    end
  end
end
