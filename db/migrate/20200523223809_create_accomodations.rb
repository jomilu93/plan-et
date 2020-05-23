class CreateAccomodations < ActiveRecord::Migration[6.0]
  def change
    create_table :accomodations do |t|
      t.string :name
      t.string :address
      t.references :city, null: false, foreign_key: true
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
