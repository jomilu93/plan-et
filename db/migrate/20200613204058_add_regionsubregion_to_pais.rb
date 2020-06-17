class AddRegionsubregionToPais < ActiveRecord::Migration[6.0]
  def change
    add_column :pais, :region, :string
    add_column :pais, :subregion, :string
  end
end
