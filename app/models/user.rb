class User < ActiveRecord::Base
  belongs_to :state
  has_secure_password
  has_many :comments, dependent: :destroy
  has_many :event_rosters, dependent: :destroy
  has_many :events, through: :event_rosters, dependent: :destroy
  has_many :events
  #belongs_to :host, class_name: 'User', foreign_key: 'user_id'
end
