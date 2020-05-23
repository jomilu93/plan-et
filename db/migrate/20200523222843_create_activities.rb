class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.date :start_time
      t.date :end_time
      t.references :part, null: false, foreign_key: true
      t.references :activityable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
