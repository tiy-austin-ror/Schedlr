class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many   :events
  belongs_to :company
  has_many   :rooms, through: :events

  def full_name
    first_name + " " + last_name
  end
end
