# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  User.delete_all
  Project.delete_all

  puts "\nCreating sample users..."

  jason = User.create name: "Jason L Perry", email: "jason@suncoast.io", role: "admin"
  tihomir = User.create name: "Tihomir Mouses", email: "tihomir@mous.es"

  puts "\nCreating sample projects..."

  Project.create([
    {title: "Illustration for Mugs", description: "An illustration of a laptop-using manatee.", bid: 42, deadline_on: 1.week.from_now, requested_by: jason, status: :in_progress, claimed_by: tihomir},
    {title: "Instagram Story for Veterans Day", description: "A composition showing some of our US Military veteran alumni, with a message thanking them for their service.", bid: 24, deadline_on: 10.days.from_now, requested_by: jason},
  ])
end
