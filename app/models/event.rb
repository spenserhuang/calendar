class Event < ActiveRecord::Base

  has_many :event_ownerships
  has_many :event_dates

end
