class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|

      t.string  :date_value
      t.string  :name_of_day
      t.integer :day_of_week
      t.integer :day_of_month
      t.integer :day_of_year
      t.integer :week_of_year
      t.string  :name_of_month
      t.integer :month_of_year
      t.integer :year_number
      t.string  :type_of_day

    end
  end
end
