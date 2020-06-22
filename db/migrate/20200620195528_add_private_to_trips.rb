class AddPrivateToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :private, :boolean
  end
end
