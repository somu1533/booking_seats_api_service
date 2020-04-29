class Seat < ApplicationRecord
  validates :seat_id, presence: true
  validates :row, presence: true
  validates :column, presence: true

  belongs_to :venue
end
