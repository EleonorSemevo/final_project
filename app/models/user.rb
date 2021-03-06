class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :name,  presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :comments, dependent: :destroy
end
