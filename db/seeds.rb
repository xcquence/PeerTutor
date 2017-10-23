# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

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

Subject.create(
  abbrev: "CSCI",
  name: "Computer Science"
)

Subject.create(
  abbrev: "MATH",
  name: "Math"
)

Course.create(
  subject: Subject.find_by_abbrev("CSCI"),
  number: "340",
  name: "Operating System"
)

Course.create(
  subject: Subject.find_by_abbrev("CSCI"),
  number: "435",
  name: "Database"
)

Course.create(
  subject: Subject.find_by_abbrev("MATH"),
  number: "160",
  name: "Matrix Algebra"
)
