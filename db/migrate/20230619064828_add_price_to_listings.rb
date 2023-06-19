class AddPriceToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :price, :float
  end
end
