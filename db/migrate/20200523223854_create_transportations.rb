class CreateTransportations < ActiveRecord::Migration[6.0]
  def change
    create_table :transportations do |t|
      t.string :type
      t.references :origin_city, null: false, foreign_key: true
      t.references :destination_city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
