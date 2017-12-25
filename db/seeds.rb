# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

puts 'Seeding Cars'

cars = Car.create([
  {
    name: 'Koenigsegg Agera R', 
    max_speed: 273 
  },
  { 
    name: 'Subaru Impreza', 
    max_speed: 280 
  },
  { 
    name: 'Bugatti Veyron Super Sport', 
    max_speed: 270 
  },
  { 
    name: '9ff GT9-R', 
    max_speed: 257 
  }
]) if Car.last.nil?

puts 'Seeding Tracks'

tracks = Track.create([
  {
    name: 'Nurburgring', 
    country: 'Germany',
    surface_type: 'snow', 
    timezone: 'CET'
  },
  {
    name: 'Sydney Motorsport Park', 
    country: 'Australia',
    surface_type: 'asphalt', 
    timezone: 'Australia/Sydney'
  },
  {
    name: 'Circuit Gilles Villenaeuve Montreal', 
    country: 'Canada',
    surface_type: 'snow', 
    timezone: 'Canada/Eastern'
  },
  {
    name: 'Guia Circut', 
    country: 'Macau',
    surface_type: 'gravel', 
    timezone: 'Asia/Macau'
  },
]) if Track.last.nil?
