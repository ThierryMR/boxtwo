class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.references :currency, foreign_key: true
      t.references :wallet, foreign_key: true
      t.float :value

      t.timestamps
    end
  end
end
