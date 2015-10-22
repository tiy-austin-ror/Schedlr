class Event < ActiveRecord::Base
  paginates_per 8
  belongs_to :room
  belongs_to :user
  has_many :invitees
  has_many :attendees

  def formatted_start_time
    self.start_time.strftime("%B %d, %Y @ %I:%M%P")
  end

  def formatted_event_duration
    "#{self.duration} minutes"
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |event|
        csv << event.attributes.values_at(*column_names)
      end
    end
  end

  def at_total_occupancy?
    self.attendees.count < self.room.capacity
  end

  def event_range
    (start_time)..(start_time + duration.minutes)
  end
end
