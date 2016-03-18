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
#  description     :text
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

  def self.all_people(current_user)
    User.where.not(id: current_user.id)
  end

  def load_received_messages
    received_messages
        .order('seen ASC')
        .order('created_at DESC')
        .preload(:sender)
  end

  def load_sent_messages
    sent_messages.preload(:recipient)
  end
end
