class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  with_options presence: true do
    validates :name
    validates :department
  end


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  with_options presence: true, format: { with: PASSWORD_REGEX,allow_blank: true} do
    validates :password
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  with_options presence: true, format: { with: VALID_EMAIL_REGEX,allow_blank: true }, uniqueness: { case_sensitive: false } do
    validates :email
  end

  has_many :categories
  has_many :rentals
  has_many :bookings
end
