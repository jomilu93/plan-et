class AddCoordinatesToParts < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :latitude, :float
    add_column :parts, :longitude, :float
  end
end
