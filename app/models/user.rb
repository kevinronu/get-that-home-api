class User < ApplicationRecord
  has_secure_token
  has_secure_password

  has_many :properties, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :contacts, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true
  validates :role, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, length: { minimum: 6 }

  enum role: { landlord: 0, seeker: 1 }
end
