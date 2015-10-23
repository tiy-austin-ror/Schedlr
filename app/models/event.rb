class Event < ActiveRecord::Base

  paginates_per 5
  belongs_to :room, counter_cache: true

  belongs_to :user
  has_many :invitees
  has_many :attendees
  has_many :attending_users, through: :attendees, source: :user
  has_many :invited_users, through: :invitees, source: :user

  def formatted_start_time
    self.start_time.strftime("%B %d, %Y @ %I:%M%P")
  end

  def formatted_event_duration
    "#{self.duration} minutes"
  end

  def is_in_private_event?(current_user)
    self.attending_users.include?(current_user) || self.invited_users.include?(current_user)
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
    self.attendees.count == self.room.capacity
  end

  def event_range
    (start_time)..(start_time + duration.minutes)
  end

  def end_time
    start_time + duration.minutes
  end

  def attending_users_count
    attending_users.count
  end
end
