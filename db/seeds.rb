#-----------------------------------------------------------------------------
# CALENDAR CREATION SET UP
#-----------------------------------------------------------------------------

@year_name = 2010
@day_number = 0
@day_name_counter = 1
@day_name = "Friday"
@month_counter = 1
@current_month = 1
@day_number_of_week = 0
@month_name = "January"
@day_type = "Weekday"
@day_counter = 1
@week_number_of_year = 1

def day_namer
  if @day_name_counter % 7 == 0
    @day_name = "Friday"
    @day_number_of_week = 5
    @day_type = "Weekday"
  elsif @day_name_counter % 7 == 1
    @day_name = "Saturday"
    @day_number_of_week = 6
    @day_type = "Weekend"
  elsif @day_name_counter % 7 == 2
    @day_name = "Sunday"
    @day_number_of_week = 7
    @day_type = "Weekend"
  elsif @day_name_counter % 7 == 3
    @day_name = "Monday"
    @day_number_of_week = 1
    @day_type = "Weekday"
  elsif @day_name_counter % 7 == 4
    @day_name = "Tuesday"
    @day_number_of_week = 2
    @day_type = "Weekday"
  elsif @day_name_counter % 7 == 5
    @day_name = "Wednesday"
    @day_number_of_week = 3
    @day_type = "Weekday"
  elsif @day_name_counter % 7 == 6
    @day_name = "Thursday"
    @day_number_of_week = 4
    @day_type = "Weekday"
  end
end

def day_reset
  if @current_month < @month_counter || ( @current_month == 12 && @month_counter == 1 )
    @day_number = 1
    @current_month = @month_counter
  elsif @current_month == @month_counter
    @day_number += 1
  end
end

def week_calculator
  @week_number_of_year = @day_counter / 7 + 1
end

#-----------------------------------------------------------------------------
# CREATE CALENDER ATTRIBUTES
#-----------------------------------------------------------------------------

91.times do

  p "*" * 50
  p "YEAR IS: #{@year_name}"
  p "*" * 50

  @day_counter = 1

  if @year_name % 4 == 0 && @year_name % 100 != 0
    while @day_counter <= 366 do

      if @day_counter <= 31
        @month_counter = 1
        @month_name = "January"
      elsif @day_counter <= 60
        @month_counter = 2
        @month_name = "February"
      elsif @day_counter <= 91
        @month_counter = 3
        @month_name = "March"
      elsif @day_counter <= 121
        @month_counter = 4
        @month_name = "April"
      elsif @day_counter <= 152
        @month_counter = 5
        @month_name = "May"
      elsif @day_counter <= 182
        @month_counter = 6
        @month_name = "June"
      elsif @day_counter <= 213
        @month_counter = 7
        @month_name = "July"
      elsif @day_counter <= 244
        @month_counter = 8
        @month_name = "August"
      elsif @day_counter <= 274
        @month_counter = 9
        @month_name = "September"
      elsif @day_counter <= 305
        @month_counter = 10
        @month_name = "October"
      elsif @day_counter <= 335
        @month_counter = 11
        @month_name = "November"
      elsif @day_counter <= 366
        @month_counter = 12
        @month_name = "December"
      end

      week_calculator
      day_reset

      Calendar.create(date_value: "#{@month_counter}/#{@day_number}/#{@year_name}", name_of_day: @day_name, day_of_week: @day_number_of_week, day_of_month: @day_number, day_of_year: @day_counter, week_of_year: @week_number_of_year, name_of_month: @month_name, month_of_year: @month_counter, year_number: @year_name, type_of_day: @day_type)

      day_namer
      @day_name_counter += 1
      @day_counter += 1
    end

  else
    while @day_counter <= 365 do

      if @day_counter <= 31
        @month_counter = 1
        @month_name = "January"
      elsif @day_counter <= 59
        @month_counter = 2
        @month_name = "February"
      elsif @day_counter <= 90
        @month_counter = 3
        @month_name = "March"
      elsif @day_counter <= 120
        @month_counter = 4
        @month_name = "April"
      elsif @day_counter <= 151
        @month_counter = 5
        @month_name = "May"
      elsif @day_counter <= 181
        @month_counter = 6
        @month_name = "June"
      elsif @day_counter <= 212
        @month_counter = 7
        @month_name = "July"
      elsif @day_counter <= 243
        @month_counter = 8
        @month_name = "August"
      elsif @day_counter <= 273
        @month_counter = 9
        @month_name = "September"
      elsif @day_counter <= 304
        @month_counter = 10
        @month_name = "October"
      elsif @day_counter <= 334
        @month_counter = 11
        @month_name = "November"
      elsif @day_counter <= 365
        @month_counter = 12
        @month_name = "December"
      end

      week_calculator
      day_reset

      Calendar.create(date_value: "#{@month_counter}/#{@day_number}/#{@year_name}", name_of_day: @day_name, day_of_week: @day_number_of_week, day_of_month: @day_number, day_of_year: @day_counter, week_of_year: @week_number_of_year, name_of_month: @month_name, month_of_year: @month_counter, year_number: @year_name, type_of_day: @day_type)

      day_namer
      @day_name_counter += 1
      @day_counter += 1
    end
  end

  @week_number_of_year = 1
  @year_name += 1

end

#-----------------------------------------------------------------------------
# TESTING EXPRESSIONS
#-----------------------------------------------------------------------------

# p "DAY NAME COUNTER IS AT: #{@day_name_counter}."
# p " MONTH COUNTER IS: #{@month_counter}."
# p "  DAY IS: #{@day_number}."
# p "   DAY NAME IS #{@day_name}."
# p "    DAY TYPE IS #{@day_type}."
# p "     DAY COUNTER IS #{@day_counter}"
# p "      WEEK NUMBER OF YEAR IS #{@week_number_of_year}"
# puts ""
