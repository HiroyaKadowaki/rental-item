class Item < ApplicationRecord

  with_options presence: true do
    validates :number, format: { with: /\A[0-9]+\z/}
  end

  validates :name, presence: true

  belongs_to :user
  belongs_to :category
  has_one :rental
end
