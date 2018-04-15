# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Link.destroy_all

Link.create([
  {site: "Snapchat", title: "Idk", url: "snapchat.com", img: "imgur.com"},
  {site: "Facebook", title: "Idk", url: "facebook.com", img: "imgur.com"},
  {site: "Twitter", title: "Idk", url: "twitter.com", img: "imgur.com"},
])
