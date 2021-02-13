class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :department
  end


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  with_options presence: true, format: { with: PASSWORD_REGEX,allow_blank: true} do
    validates :password
  end

  has_many :categories
  has_many :rentals
  has_many :bookings
end
