class User < ActiveRecord::Base
  belongs_to :state
  has_secure_password
  has_many :comments, dependent: :destroy
  has_many :event_rosters, dependent: :destroy
  has_many :events, through: :event_rosters, dependent: :destroy
  has_many :events
  #belongs_to :host, class_name: 'User', foreign_key: 'user_id'
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true, length: { in: 2..20 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :age, numericality: { greater_than: 10, less_than: 150}
	before_save do
		self.email.downcase!
	end
  before_create do
    self.admin = false #assuming there is an admin field with a boolean value
  end
  def full_name
  	self.first_name + " " + self.last_name
  end
  def admin?
  	self.admin
  end
end
