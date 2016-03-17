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

FactoryGirl.define do
  factory :user, class: User do
    name 'nongdenchet'
    email 'nongdenchet@gmail.com'
    password 'androidDeveloper'
    password_confirmation 'androidDeveloper'
  end
end
