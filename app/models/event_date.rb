class EventDate < ActiveRecord::Base

  belongs_to :event
  belongs_to :calendar

end
