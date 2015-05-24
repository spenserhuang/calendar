class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|

      t.string :date_value
      # t.string :name_of_day
      # t.integer :day_number_of_week
      t.integer :day_number_of_month
      # t.integer :day_number_of_year
      # t.integer :week_number_of_month
      # t.integer :week_number_of_year
      # t.string :name_of_month
      t.integer :month_number_of_year
      t.integer :year_number
      # t.string :day_type
      # t.string :holiday

    end
  end
end
