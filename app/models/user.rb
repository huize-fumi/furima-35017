class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,       presence: true
  validates :email,          presence: true, uniqueness: true, length: { minimum: 6 }
  template = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password,       presence: true, format: { with: template }
  validates :last_name,      presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
  validates :first_name,     presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }

  with_options presence: true do
    validates :last_name_ruby, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_ruby, format: { with: /\A[ァ-ヶー－]+\z/ }
  end

  validates :birthday, presence: true
end
