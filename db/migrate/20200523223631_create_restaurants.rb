class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.integer :rating
      t.integer :avg_price
      t.string :business_hours
      t.string :address
      t.string :phone_number
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
