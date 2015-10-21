class Event < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  has_many :invitees
  has_many :attendees

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |event|
        csv << event.attributes.values_at(*column_names)
      end
    end
  end
end
