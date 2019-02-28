# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# courses
5.times do
  Course.create(
    name: Faker::Educator.course_name,
    hours: rand(20..60)*5,
  )
end

#cohorts
15.times do
  Cohort.create(
    name: Faker::Dessert.flavor,
    course_id: rand(1..5),
    start_date: Faker::Date.forward(15),
    end_date: Faker::Date.forward(15..150),
  )
end

50.times do
  i = rand(0..3)
  edu = ["High School", "College", "Masters", "Ph.D"]
  Instructor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..90),
    education: edu[i],
    salary: rand(36..120)*1000,
    cohort_id: rand(1..15),
  )
end

100.times do
  i = rand(0..3)
  edu = ["High School", "College", "Masters", "Ph.D"]

  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..90),
    education: edu[i],
    cohort_id: rand(1..15),
  )
end

