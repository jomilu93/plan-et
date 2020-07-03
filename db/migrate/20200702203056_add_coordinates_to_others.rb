class AddCoordinatesToOthers < ActiveRecord::Migration[6.0]
  def change
    add_column :others, :latitude, :float
    add_column :others, :longitude, :float
  end
end
