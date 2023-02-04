class AddPriceToYacht < ActiveRecord::Migration[7.0]
  def change
    add_column :yachts, :price, :float
  end
end
