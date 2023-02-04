class AddTypeToYacht < ActiveRecord::Migration[7.0]
  def change
    add_column :yachts, :type, :integer
  end
end
