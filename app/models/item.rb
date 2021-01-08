class Item < ApplicationRecord

  with_options presence: true do
    validates :number formet: { with:/\d/ }
    validates :name
  end

  belongs_to :user
  has_one :rental
end
