class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :name
      t.text :description
      t.references :activityable, polymorphic: true, null:false, index: true
      t.references :itinerary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
