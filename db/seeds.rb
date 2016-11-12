require 'faker'

100.times do
  Movie.create(title: Faker::Name.title)
end
