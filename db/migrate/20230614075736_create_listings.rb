class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :address
      t.text :description
      t.integer :max_cap
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
