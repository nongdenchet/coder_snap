# == Schema Information
#
# Table name: relations
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  target_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean          default(FALSE)
#

class Relation < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, class_name: User, foreign_key: :target_id

  validates_presence_of :name, :target_id, :user_id
end
