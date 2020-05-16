class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :cuisine
      t.integer :rating
      t.integer :price
      t.string :phone_number
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
