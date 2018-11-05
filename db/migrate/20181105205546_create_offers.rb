class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :type
      t.float :price
      t.float :amount
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end
