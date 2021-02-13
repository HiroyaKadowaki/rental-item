class Booking < ApplicationRecord

  validates :date, presence: true
  validates :item_id, uniqueness: true

  belongs_to :user
  belongs_to :item
end
