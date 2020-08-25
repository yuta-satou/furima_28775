class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  # ユーザー情報の実装条件
  validates :nickname, 
    presence: true
  validates :family_name,
    presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :name,
    presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :family_name_kana,
    presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :name_kana,
    presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :email,
    presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  validates :birthdate,
    presence: true
  validates :password,
    presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :password_confirmation,
    presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
end