# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Student.create!(name:  "Runding",
             email: "wangrunding@gmail.com",
             password:              "wangrun123ding",
             password_confirmation: "wangrun123ding")

Tutor.create!(name:  "Runding",
                email: "wangrunding@gmail.com",
                password:              "wangrun123ding",
                password_confirmation: "wangrun123ding")


(1..40).each do |n|
  name  = Faker::Name.name
  email = "example-#{n}@gmail.org"
  password = "password"
  Tutor.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

(41..80).each do |n|
  name  = Faker::Name.name
  email = "example-#{n+41}@gmail.org"
  password = "password"
  Student.create!(name:  name,
                email: email,
                password:              password,
                password_confirmation: password)
end

tutors = Tutor.order(:created_at).take(6)
50.times do
  title = Faker::Music.instrument + " grade " + Faker::Number.between(1, 10).to_s
  content = Faker::Lorem.sentence(5)
  tutors.each { |tutor|
    tutor.courses.create!(title: title, content: content)
  }
end
