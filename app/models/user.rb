class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         has_many :items
         has_many :orders
         has_many :messages
  # ユーザー情報の実装条件
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  EMAIL_REGEX = /@.+/
  validates :nickname,
            presence: true
  validates :family_name,
            presence: true, format: { with: NAME_REGEX }
  validates :name,
            presence: true, format: { with: NAME_REGEX }
  validates :family_name_kana,
            presence: true, format: { with: NAME_KANA_REGEX }
  validates :name_kana,
            presence: true, format: { with: NAME_KANA_REGEX }
  validates :birthdate,
            presence: true
  validates :password,
            presence: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
  validates :password_confirmation,
            presence: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
