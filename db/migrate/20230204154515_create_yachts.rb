class CreateYachts < ActiveRecord::Migration[7.0]
  def change
    create_table :yachts do |t|
      t.string :title
      t.string :name
      t.float :length
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
