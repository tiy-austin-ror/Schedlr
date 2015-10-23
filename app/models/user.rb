class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events
  has_many :rooms, through: :events
  has_many :attendees
  has_many :invitees
  belongs_to :company

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.top
    order('attendees_count DESC').limit(3)
  end
end
