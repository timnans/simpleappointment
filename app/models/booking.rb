class Booking < ApplicationRecord
  validates :start, :end, presence: true
  belongs_to :room
  belongs_to :user
  validate :no_past_booking
  validate :check_overlap

  def no_past_booking
    if Date.today.after?(start.to_date)
      self.errors.add(:start, "cannot be in the past")
    elsif Date.today.after?(self.end.to_date)
      self.errors.add(:end, "cannot be in the past")
    end
  end

  # def check_overlap
  #   # bookings = Booking.where(room_id: id)
  #   # overlap = bookings.select { |booking| (start - booking.end) * (booking.start -self.end) > 0 }
  #   # unless overlap.blank?
  #   #   raise "Conflictng erros"
  #   # end

  #   return if Booking.where(room_id: id, end: > self.end, start: < self.start)
  #   # return if Booking.where('room_id = ? AND (end> ? OR start < ?)',
  #   # room_id, start, self.end).none?
  # errors.add(:start, 'Times overlap another showtime on this screen')
  # end
end
