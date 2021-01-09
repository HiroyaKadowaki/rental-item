class Rental < ApplicationRecord

  validates :rental_day, presence: true

  belongs_to :item
  belongs_to :user
end
