class AddCoordinatesToAccomodation < ActiveRecord::Migration[6.0]
  def change
    add_column :accomodations, :latitude, :float
    add_column :accomodations, :longitude, :float
  end
end
