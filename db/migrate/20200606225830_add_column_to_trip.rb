class AddColumnToTrip < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :cities, :string, array: true, default: []
    add_column :trips, :countries, :string, array: true, default: []
  end
end
