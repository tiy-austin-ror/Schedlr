class Site < ActiveRecord::Base
  belongs_to :company
  has_many :buildings
end
