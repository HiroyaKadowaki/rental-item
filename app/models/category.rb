class Category < ApplicationRecord

  validates :name, presence: true


  has_many :items, dependent: :destroy
  belongs_to :user
end
