# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Keith Richards", genre: "rock", bio: "RollingStones for too many years." )
User.create(name: "Beyonce", genre: "soul", bio: "I got hot sauce in my bag, swag.." )
User.create(name: "John Coltraine", genre: "jazz", bio: "Soprano sax extrodinare." )
User.create(name: "Jim Croce", genre: "rock", bio: "Played all my life" )
User.create(name: "Guy Clarke", genre: "country", bio: "Pickin" )

Jam.create(name: "Weekend warriors", genre: "rock", date: 20-24-03)

Instrument.create(name: "guitar")
Instrument.create(name: "drums")
Instrument.create(name: "vocals")
