# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'as-duration'   #pbl d'install
require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all


# seed Speciality
my_speciality = ['ophtalmologue','généraliste','cardiologue','ORL','gynécologue']
my_speciality.each { |spe| Speciality.create(name: spe) }

# seed Patient
75.times do
  Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

# seed Doctor
20.times do
  s = Speciality.order("RANDOM()").limit(1).ids[0]
  Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    speciality: s,
    zip_code: Faker::Number.number(5)
  )
end

# seed City
10.times do
  City.create!(
    name_town: Faker::Address.city
  )
end

# seed Appointment
100.times do
  d = Doctor.order("RANDOM()").limit(1).ids[0]
  p = Patient.order("RANDOM()").limit(1).ids[0]
  c = City.order("RANDOM()").limit(1).ids[0]
  Appointment.create!(
    doctor_id: d ,
    patient_id: p,
    city_id: c,
    date: Faker::Time.between(DateTime.now, DateTime.now + 45)
  )
end

# Doctor.order("RANDOM()").limit(1).ids[0]
# Patient.order("RANDOM()").limit(1).ids[0]