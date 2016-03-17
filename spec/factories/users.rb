FactoryGirl.define do
  factory :user, class: User do
    name FFaker::Name.name
    email 'nongdenchet@gmail.com'
    password 'androidDeveloper'
    password_confirmation 'androidDeveloper'
  end
end
