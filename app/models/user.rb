class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: {minimum: 8}
  validates :password_confirmation, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
