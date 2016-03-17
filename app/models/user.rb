# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :sent_messages, class_name: Message, foreign_key: :sender_id
  has_many :received_messages, class_name: Message, foreign_key: :recipient_id

  has_secure_password
  validates :password, length: {minimum: 8}
  validates :password_confirmation, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
