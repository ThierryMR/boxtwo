class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.references :user, foreign_key: true
      t.references :currency, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
