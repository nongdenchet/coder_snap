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

FactoryGirl.define do
  factory :user_relation, class: Relation do
    name 'friend'
  end

  factory :target_relation, class: Relation do
    name 'friend'
  end

  factory :user_active_relation, class: Relation do
    name 'friend'
    active true
  end

  factory :target_active_relation, class: Relation do
    name 'friend'
    active true
  end
end
