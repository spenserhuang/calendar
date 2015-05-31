current_date  = Date.today.to_s.split('')
current_year  = current_date[0] + current_date[1] + current_date[2] + current_date[3]
current_month = current_date[5] + current_date[6]
current_day   = current_date[8] + current_date[9]
current_year = current_year.to_i
current_month = current_month.to_i
current_day = current_day.to_i
# current_week  = Date.today.cweek
current_date_value = "#{current_month}/#{current_day}/#{current_year}"

enable :session

get '/calendars/home' do
  @current_month_calendar = Calendar.where(year_number: current_year, month_of_year: current_month)
  @start_of_month = @current_month_calendar.first.name_of_day
  erb :'/calendars/home'
end

get '/calendars/current_year' do
  @current_year_calendar = Calendar.where(year_number: current_year)
  erb :'/calendars/current_year_view'
end

get '/calendars/current_month' do
  @current_month_calendar = Calendar.where(year_number: current_year, month_of_year: current_month)
  @start_of_month = @current_month_calendar.first.name_of_day
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
  erb :'/calendars/current_five_day_view'
end

get '/calendars/current_day' do
  @current_day_calendar = Calendar.where(year_number: current_year, month_of_year: current_month, day_of_month: current_day)
  erb :'/calendars/current_day_view'
end

# get '/calendars/current_week_of_year' do
#   @current_week_of_year_calendar = Calendar.where(year_number: current_year, month_of_year: current_month, week_of_year: current_week)
#   erb :'/calendars/current_week_of_year_view'
# end



post '/calendars/choose_date' do
  @chosen_date = params[:event_date_value]
  @chosen_year  = @chosen_date[0] + @chosen_date[1] + @chosen_date[2] + @chosen_date[3]
  @chosen_month = @chosen_date[5] + @chosen_date[6]
  @chosen_day   = @chosen_date[8] + @chosen_date[9]
  @chosen_year = @chosen_year.to_i
  @chosen_month = @chosen_month.to_i
  @chosen_day = @chosen_day.to_i
  # @chosen_week  = @chosen_date.cweek
  @chosen_date_value = "#{@chosen_month}/#{@chosen_day}/#{@chosen_year}"
  session[:chosen_date] = Calendar.find_by(date_value: @chosen_date_value)
  redirect '/calendars/chosen_month'
end

get '/calendars/chosen_year' do
  p session[:chosen_date]
  @chosen_year_calendar = Calendar.where(year_number: session[:chosen_date].year_number)
  erb :'/calendars/chosen_year_view'
end

get '/calendars/chosen_month' do
  @chosen_month_calendar = Calendar.where(year_number: session[:chosen_date].year_number, month_of_year: session[:chosen_date].month_of_year)
  @start_of_month = @chosen_month_calendar.first.name_of_day
  erb :'/calendars/chosen_month_view'
end

get '/calendars/chosen_week' do
  @chosen_week_calendar_list = []
  chosen_day_id = session[:chosen_date].id
  @chosen_week_calendar_list << Calendar.find(chosen_day_id - 6)
  @chosen_week_calendar_list << Calendar.find(chosen_day_id - 5)
  @chosen_week_calendar_list << Calendar.find(chosen_day_id - 4)
  @chosen_week_calendar_list << Calendar.find(chosen_day_id - 3)
  @chosen_week_calendar_list << Calendar.find(chosen_day_id - 2)
  @chosen_week_calendar_list << Calendar.find(chosen_day_id - 1)
  @chosen_week_calendar_list << session[:chosen_date]
  @chosen_week_calendar_list << Calendar.find(chosen_day_id + 1)
  @chosen_week_calendar_list << Calendar.find(chosen_day_id + 2)
  @chosen_week_calendar_list << Calendar.find(chosen_day_id + 3)
  @chosen_week_calendar_list << Calendar.find(chosen_day_id + 4)
  @chosen_week_calendar_list << Calendar.find(chosen_day_id + 5)
  @chosen_week_calendar_list << Calendar.find(chosen_day_id + 6)
  erb :'/calendars/chosen_week_view'
end

get '/calendars/chosen_five_day' do
  chosen_day_id = session[:chosen_date].id
  @chosen_five_day_list = []
  @chosen_five_day_list << session[:chosen_date]
  @chosen_five_day_list << Calendar.find(chosen_day_id + 1)
  @chosen_five_day_list << Calendar.find(chosen_day_id + 2)
  @chosen_five_day_list << Calendar.find(chosen_day_id + 3)
  @chosen_five_day_list << Calendar.find(chosen_day_id + 4)
  erb :'/calendars/chosen_five_day_view'
end

get '/calendars/chosen_day' do
  @chosen_day_calendar = Calendar.where(year_number: session[:chosen_date].year_number, month_of_year: session[:chosen_date].month_of_year, day_of_month: session[:chosen_date].day_of_month)
  erb :'/calendars/chosen_day_view'
end
