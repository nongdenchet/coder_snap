users = []

20.times do |index|
  users << User.create(
      name: FFaker::Name.name,
      email: FFaker::Internet.email,
      password: "password-#{index}",
      description: FFaker::Lorem.paragraph(5),
      password_confirmation: "password-#{index}"
  )
end

me = User.create(
    name: 'nongdenchet',
    email: 'nongdenchet@gmail.com',
    description: FFaker::Lorem.paragraph(5),
    password: 'androidDeveloper7',
    password_confirmation: 'androidDeveloper7'
)

User.take(15).each do |user|
  me.relations.create(
      name: %w(friend block).sample,
      target_id: user.id,
      active: true
  )

  user.relations.create(
      name: %w(friend block).sample,
      target_id: me.id,
      active: true
  )

  me.sent_messages.create(
      recipient_id: user.id,
      content: FFaker::Lorem.paragraph(10),
      seen: [true, false].sample
  )

  5.times do
    me.received_messages.create(
        sender_id: user.id,
        content: FFaker::Lorem.paragraph(10),
        seen: [true, false].sample
    )
  end
end

