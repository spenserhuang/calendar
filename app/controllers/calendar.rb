current_date  = Date.today.to_s.split('')
current_year  = current_date[0] + current_date[1] + current_date[2] + current_date[3]
current_month = current_date[5] + current_date[6]
current_day   = current_date[8] + current_date[9]
current_year = current_year.to_i
current_month = current_month.to_i
current_day = current_day.to_i
current_week  = Date.today.cweek
current_date_value = "#{current_month}/#{current_day}/#{current_year}"

get '/calendars/current_year' do
  @current_year_calendar = Calendar.where(year_number: current_year)
  erb :'/calendars/current_year_view'
end

get '/calendars/current_month' do
  @current_month_calendar = Calendar.where(year_number: current_year, month_of_year: current_month)
  erb :'/calendars/current_month_view'
end

get '/calendars/current_week' do
  @week_calendar_list = []
  @current_day = Calendar.find_by(date_value: current_date_value)
  current_day_id = @current_day.id
  @week_calendar_list << Calendar.find(current_day_id - 6)
  @week_calendar_list << Calendar.find(current_day_id - 5)
  @week_calendar_list << Calendar.find(current_day_id - 4)
  @week_calendar_list << Calendar.find(current_day_id - 3)
  @week_calendar_list << Calendar.find(current_day_id - 2)
  @week_calendar_list << Calendar.find(current_day_id - 1)
  @week_calendar_list << @current_day
  @week_calendar_list << Calendar.find(current_day_id + 1)
  @week_calendar_list << Calendar.find(current_day_id + 2)
  @week_calendar_list << Calendar.find(current_day_id + 3)
  @week_calendar_list << Calendar.find(current_day_id + 4)
  @week_calendar_list << Calendar.find(current_day_id + 5)
  @week_calendar_list << Calendar.find(current_day_id + 6)

  erb :'/calendars/current_week_view'
end

get '/calendars/five_day' do
  @current_day = Calendar.find_by(date_value: current_date_value)
  current_day_id = @current_day.id
  @five_day_list = []
  @five_day_list << @current_day
  @five_day_list << Calendar.find(current_day_id + 1)
  @five_day_list << Calendar.find(current_day_id + 2)
  @five_day_list << Calendar.find(current_day_id + 3)
  @five_day_list << Calendar.find(current_day_id + 4)
  erb :'/calendars/five_day_view'
end

get '/calendars/current_day' do
  @current_day_calendar = Calendar.where(year_number: current_year, month_of_year: current_month, day_of_month: current_day)
  erb :'/calendars/current_day_view'
end

get '/calendars/current_week_of_year' do
  @current_week_of_year_calendar = Calendar.where(year_number: current_year, month_of_year: current_month, week_of_year: current_week)
  erb :'/calendars/current_week_of_year_view'
end

