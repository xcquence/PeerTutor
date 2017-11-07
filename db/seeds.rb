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

Product.create(
  name: "$5 Bundle",
  v_currency: 450,
  price: 5.00,
  description: "Buy $5.00 for 450 Tip Points!"
)

Product.create(
  name: "$10 Bundle",
  v_currency: 980,
  price: 10.00,
  description: "Buy $10.00 for 980 Tip Points!"
)

Product.create(
  name: "$20 Bundle",
  v_currency: 1990,
  price: 20.00,
  description: "Buy $20.00 for 1990 Tip Points!"
)

Product.create(
    name: "$100 MEGA bundle",
    v_currency: 10300,
    price: 100.00,
    description: "Buy $100.00 for 10300 Tip Points! (GET 300 FREE POINTS!)"
)

csv_file1 = 'courses_data.csv'
CSV.read(csv_file1, :encoding => 'windows-1251:utf-8')
csv_file2 = 'subjects_data.csv'
CSV.read(csv_file2, :encoding => 'windows-1251:utf-8')

CSV.foreach(csv_file1, headers: true, encoding: 'ISO-8859-1:UTF-8') do |row|
    Course.create!(row.to_hash)

end
CSV.foreach(csv_file2, headers: true, encoding: 'ISO-8859-1:UTF-8') do |row|
    Subject.create!(row.to_hash)

end
