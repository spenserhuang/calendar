class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string  :title
      t.text    :description
      t.string  :location
      t.string  :event_date_value
      t.time    :event_time_value

      t.timestamps

    end
  end
end
