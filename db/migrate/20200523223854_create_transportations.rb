class CreateTransportations < ActiveRecord::Migration[6.0]
  def change
    create_table :transportations do |t|
      t.string :transportation_type
      t.references :origin_city, null: false, foreign_key: {to_table: "cities"}
      t.references :destination_city, null: false, foreign_key: {to_table: "cities"}

      t.timestamps
    end
  end
end
