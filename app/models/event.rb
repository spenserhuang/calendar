class Event < ActiveRecord::Base

  has_many :event_ownerships
  has_many :users, through: :event_ownerships

  has_many :event_dates
  has_many :calendars, through: :event_dates

end
