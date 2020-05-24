class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.integer :rating
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
