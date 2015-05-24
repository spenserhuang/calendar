class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string :title
      t.string :description
      t.string :location
      t.time   :event_time

      t.timestamps

    end
  end
end
