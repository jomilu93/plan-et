class AddCoordinatesToAttractions < ActiveRecord::Migration[6.0]
  def change
    add_column :attractions, :latitude, :float
    add_column :attractions, :longitude, :float
  end
end
