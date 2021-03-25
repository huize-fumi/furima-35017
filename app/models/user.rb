class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,       presence: true
  validates :email,          presence: true, uniqueness: true
  validates :password,       presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上かつ英数字をそれぞれ含めてください" }
  validates :last_name,      presence: true
  validates :first_name,     presence: true
  validates :last_name_ruby, presence: true
  validates :first_name_ruby,presence: true

end
