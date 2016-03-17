FactoryGirl.define do
  factory :user, class: User do
    name 'nongdenchet'
    email 'nongdenchet@gmail.com'
    password 'androidDeveloper'
    password_confirmation 'androidDeveloper'
  end
end
