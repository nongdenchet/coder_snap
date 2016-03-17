users = []

10.times do |index|
  users << User.create(
      name: FFaker::Name.name,
      email: FFaker::Internet.email,
      password: "password-#{index}",
      password_confirmation: "password-#{index}"
  )
end

me = User.create(
    name: 'nongdenchet',
    email: 'nongdenchet8435848@gmail.com',
    password: 'androidDeveloper7',
    password_confirmation: 'androidDeveloper7'
)

users.each do |user|
  me.sent_messages.create(
      recipient_id: user.id,
      content: FFaker::Lorem.paragraph(1),
      seen: [true, false].sample
  )
end

