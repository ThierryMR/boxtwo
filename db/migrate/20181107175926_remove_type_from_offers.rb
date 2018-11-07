class RemoveTypeFromOffers < ActiveRecord::Migration[5.2]
  def change
    remove_column :offers, :type, :string
  end
end
