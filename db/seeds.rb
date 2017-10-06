# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


8.times do |n|
  Rate.create(sell: [71.2, 70.3, 69.4, 72.9, 75.1].sample,
              buy: [65.2, 67.7, 63.4, 64.9, 66.5].sample,
              currency: 'EUR',
              created_at: DateTime.parse("#{Date.yesterday} #{n + 10}:00"))

  Rate.create(sell: [63.2, 62.3, 61.4, 64.9, 67.1].sample,
              buy: [57.2, 59.7, 55.4, 56.9, 58.5].sample,
              currency: 'USD',
              created_at: DateTime.parse("#{Date.yesterday} #{n + 10}:00"))
end
