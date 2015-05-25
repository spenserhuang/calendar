require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  has_many :event_ownerships
  has_many :events, through: :event_ownerships

end
