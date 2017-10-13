# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@users_first_names = ["", "Michael", "John", "Bob"]
@users_last_names = ["", "Jackson", "Travolta", "Dilan"]

password = 'pass123'
1.upto(3) do |i|
  User.create(
    first_name: @users_first_names[i],
    last_name: @users_last_names[i],
    email: "user-#{i}@example.com",
    password: password,
    password_confirmation: password
  )
end
