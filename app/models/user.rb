class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください'} do
  validates :name
  validates :department
  end


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  with_options format: { with: PASSWORD_REGEX } do
    validates :password
  end
end
