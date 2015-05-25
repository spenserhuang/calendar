get '/events/new' do
  erb :'/events/new_event_form'
end

post '/events' do
  desired_event_date = params[:event_date_value].split('')
  p desired_event_date
  desired_event_year  = desired_event_date[0] + desired_event_date[1] + desired_event_date[2] + desired_event_date[3]
  desired_event_month = desired_event_date[5] + desired_event_date[6]
  desired_event_day   = desired_event_date[8] + desired_event_date[9]
  desired_event_year  = desired_event_year.to_i
  desired_event_month = desired_event_month.to_i
  desired_event_day   = desired_event_day.to_i
  desired_event_date_reformat = "#{desired_event_month}/#{desired_event_day}/#{desired_event_year}"

  @event = Event.new(
    title:            params[:title],
    description:      params[:description],
    location:         params[:location],
    event_date_value: desired_event_date_reformat,
    event_time_value: params[:event_time_value]
  )

  @event.users << current_user
  @event.calendars << Calendar.find_by(date_value: desired_event_date_reformat)

  if @event.save
    redirect "/calendars/current_month"
  else
    redirect '/events/new'
  end
end

get '/events/:id/edit' do
  @edit_event = Event.find(params[:id])
  erb :'/events/edit_event'
end

put '/events/:id' do
  @edit_event = Event.find(params[:id])

  desired_event_date = params[:event_date_value].split('')
  p desired_event_date
  desired_event_year  = desired_event_date[0] + desired_event_date[1] + desired_event_date[2] + desired_event_date[3]
  desired_event_month = desired_event_date[5] + desired_event_date[6]
  desired_event_day   = desired_event_date[8] + desired_event_date[9]
  desired_event_year  = desired_event_year.to_i
  desired_event_month = desired_event_month.to_i
  desired_event_day   = desired_event_day.to_i
  desired_event_date_reformat = "#{desired_event_month}/#{desired_event_day}/#{desired_event_year}"

  @edit_event.update_attributes(
    title:            params[:title],
    description:      params[:description],
    location:         params[:location],
    event_date_value: desired_event_date_reformat,
    event_time_value: params[:event_time_value]
    )
  redirect '/calendars/current_month'
end

get '/events/:id' do
  @event = Event.find(params[:id])
  erb :'/events/event_page'
end

