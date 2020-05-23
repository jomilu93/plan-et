class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :address
      t.string :type
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
