class User < ActiveRecord::Base

  has_many :event_ownerships

end
