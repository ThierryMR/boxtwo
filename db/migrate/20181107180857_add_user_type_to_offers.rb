class AddUserTypeToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :user_type, :string
  end
end
