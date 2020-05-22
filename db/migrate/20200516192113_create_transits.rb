class CreateTransits < ActiveRecord::Migration[6.0]
  def change
    create_table :transits do |t|
      t.string :transportation_type
      t.string :origin
      t.string :destination
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
