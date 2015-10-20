class Building < ActiveRecord::Base
  belongs_to :site
  has_many :rooms
end
