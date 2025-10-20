require "faker"
Faker::UniqueGenerator.clear

[Ship, Pirate, Crew].each(&:delete_all)

roles = Pirate::ROLES

crews = Array.new(rand(6..8)) do
  Crew.create!(
    name:   Faker::JapaneseMedia::OnePiece.unique.location,
    sea:    Faker::JapaneseMedia::OnePiece.sea,
    island: Faker::JapaneseMedia::OnePiece.island
  )
end

crews.each do |crew|
  Ship.create!(
    name:     "#{Faker::JapaneseMedia::OnePiece.location} Pirate Ship",
    crew:     crew,
    location: Faker::JapaneseMedia::OnePiece.island
  )
end

fruits = Array.new(40) { Faker::JapaneseMedia::OnePiece.akuma_no_mi }.uniq

Array.new(rand(45..60)) do
  crew = crews.sample
  Pirate.create!(
    name:        Faker::JapaneseMedia::OnePiece.character,
    role:        roles.sample,
    bounty:      rand(10_000_000..5_000_000_000),
    crew:        crew,
    devil_fruit: [fruits.sample, nil, ""].sample,
    quote:       Faker::JapaneseMedia::OnePiece.quote
  )
end

puts "Seeded: #{Crew.count} crews, #{Ship.count} ships, #{Pirate.count} pirates."
