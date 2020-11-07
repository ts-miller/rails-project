# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

creators = Creator.create([
    { name: "The Holy Post", email: "holypost@gmail.com", password: "password", about: "We make podcasts about faith.", state: "Chicago" },
    { name: "Colins Last Stand", email: "colinslaststand@gmail.com", password: "password", about: "We make video game stuff.", state: "Virginia" },
    { name: "Tronics Fix", email: "tronicsfix@gmail.com", password: "password", about: "I make repair vidoes.", state: "Washington" }
])

creators.each do |creator|
    title_inc = 0
    amount_inc = 0
    10.times do
        title_inc += 1
        amount_inc += 5
        tier = creator.tiers.build(
            title: "Tier #{title_inc}", amount: amount_inc, description: "The description for Tier #{title_inc}"
        )
        tier.save
    end
end

    
