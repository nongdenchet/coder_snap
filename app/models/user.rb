class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: {minimum: 8}
  validates :password_confirmation, presence: true
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
