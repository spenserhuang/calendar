class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|

      t.integer :calendar_id
      t.integer :event_id

    end
  end
end
