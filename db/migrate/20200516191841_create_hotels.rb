class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.integer :rating
      t.integer :price
      t.string :phone_number
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
