class AddCategoryToYacht < ActiveRecord::Migration[7.0]
  def change
    add_column :yachts, :category, :string
  end
end
