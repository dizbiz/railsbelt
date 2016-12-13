class Event < ActiveRecord::Base
 
	belongs_to :state
	has_many :event_rosters, dependent: :destroy
	has_many :users, through: :event_rosters, dependent: :destroy
	belongs_to :host, :class_name => :User, :foreign_key => "user_id" 
end
