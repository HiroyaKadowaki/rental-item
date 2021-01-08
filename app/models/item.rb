class Item < ApplicationRecord

  with_options presence: true, format: { with:/\d/ } do
    validates :number
  end

  validates :name, presence: true

  belongs_to :user
  has_one :rental
end
