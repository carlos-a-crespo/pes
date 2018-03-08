# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EventType.create!(name: 'Fiesta Patronal', color: '#FCD581')
EventType.create!(name: 'Misa de Unción por los Enfermos', color: '#7EA16B')
EventType.create!(name: 'Bautismo', color: '#DDF0FF')
EventType.create!(name: 'Primera Comunión', color: '#C1CFDA')
EventType.create!(name: 'Confirmación', color: '#D52941')
EventType.create!(name: 'Casamiento', color: '#E0E0E2')
