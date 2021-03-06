# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Setting.destroy_all
Link.destroy_all
User.destroy_all
brandon = User.create!(username: "brandon", email: "brandon@brandon.com", password: "password", admin: true)

brandon.links.create([
  {site: "Snapchat", title: "My Snapchat", url: "https://www.snapchat.com/add/apocsnap", img: "https://app.snapchat.com/web/deeplink/snapcode?username=apocsnap&type=SVG"},
  {site: "Facebook", title: "Zuck FB", url: "https://www.facebook.com/zuck", img: "https://scontent-atl3-1.xx.fbcdn.net/v/t34.0-1/p200x200/16176889_112685309244626_578204711_n.jpg?_nc_cat=0&oh=595a6b6d64bd8c6ba24b74518726bf6f&oe=5AD84765"},
  {site: "Twitter", title: "GA Twitter", url: "https://twitter.com/GA_DC", img: "https://pbs.twimg.com/profile_images/894582346065874944/TpJdY0IQ_400x400.jpg"},
])

brandon.settings.create(title: "Brandon's Page", about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", embedded: "https://www.youtube.com/embed/U31cQJLi-mQ")

freeyourbio = User.create!(username: "freeyourbio", email: "freeyourbio@gmail.com", password: "password", admin: true)
freeyourbio.links.create([
  {site: "Snapchat", title: "Our Snapchat", url: "https://www.snapchat.com/add/freeyourbio", img: "https://app.snapchat.com/web/deeplink/snapcode?username=freeyourbio&type=SVG"},
  {site: "Instagram", title: "Our Insta", url: "https://instagram.com/freeyourbio", img: "https://instagram.fist1-2.fna.fbcdn.net/vp/f17e1275a70fc32e93cbf434ddc32bcd/5B6CCC7A/t51.2885-19/11906329_960233084022564_1448528159_a.jpg"},
  {site: "Twitter", title: "Our Twitter", url: "https://twitter.com/freeyourbio", img: "https://abs.twimg.com/sticky/default_profile_images/default_profile_400x400.png"},
])
freeyourbio.settings.create(title: "#FreeYourBio", about: "#FreeYourBio was created because social media bios are being consumed by links to other social media, websites, YouTube videos, etc. These bios often have limited characters which causes you to run out of room to talk about YOU, especially when you have other things in your bio.", embedded: "")
