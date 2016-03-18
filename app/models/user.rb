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
  has_many :friend_relations, -> { where name: 'friend', active: true }, class_name: Relation
  has_many :friends, through: :friend_relations, source: :target
  has_many :block_relations, -> { where name: 'block', active: true }, class_name: Relation
  has_many :blocks, through: :block_relations, source: :target

  has_many :relations, dependent: :destroy
  has_many :sent_messages, class_name: Message, foreign_key: :sender_id, dependent: :destroy
  has_many :received_messages, class_name: Message, foreign_key: :recipient_id, dependent: :destroy

  has_secure_password
  validates :password, length: {minimum: 8}
  validates :password_confirmation, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  def available_users
    User.where('id NOT IN (?) AND id != (?)', relations.select(:target_id), id)
  end

  def load_received_messages
    received_messages
        .where('sender_id NOT IN (?)', block_relations.select(:target_id))
        .order('seen ASC')
        .order('created_at DESC')
        .preload(:sender)
  end

  def load_sent_messages
    sent_messages.preload(:recipient)
  end
end
