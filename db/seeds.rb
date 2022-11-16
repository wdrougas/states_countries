# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'

Country.destroy_all
State.destroy_all

country_response = RestClient.get('https://xc-countries-api.herokuapp.com/api/countries/')
countries = JSON.parse(country_response)
states = []

countries.each do |c|
  code = c["code"]
  states_response = RestClient.get("https://xc-countries-api.herokuapp.com/api/countries/#{code}/states/")
  current_states = JSON.parse(states_response)
  states.push(current_states)
end

a = states.flatten
states = a.flatten

countries.each do |c|
  Country.create({heroku_id: c["id"], code: c["code"], name: c["name"]})
end

states.each do |s|
  State.create!({heroku_id: s["id"], code: s["code"], name: s["name"], country_id: s["countryId"]})
end

p "Created #{Country.count} countries"
p "Created #{State.count} states"