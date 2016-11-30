# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Serie.create
  Serie.create
  Serie.create
  Serie.create
  Serie.create
  Serie.create

  Car.create(fuel_type: 'Gasolina normal', plate: '1A2B3C', model: 'teste', year: '1999', fuel_capacity: 100, manufacturer: 'teste')
  Car.create(fuel_type: 'Gasolina normal', plate: '2A2B3C', model: 'teste', year: '1999', fuel_capacity: 100, manufacturer: 'teste')
  Car.create(fuel_type: 'Gasolina normal', plate: '3A2B3C', model: 'teste', year: '1999', fuel_capacity: 100, manufacturer: 'teste')
  Car.create(fuel_type: 'Gasolina normal', plate: '4A2B3C', model: 'teste', year: '1999', fuel_capacity: 100, manufacturer: 'teste')

  Supply.create(fuel_type: 'Gasolina normal', odometer_from_car: 0, fuel_quantity: 50, total_cost: 100, cost_liter: 2, series_id: 1, car_id: 1)
  Supply.create(fuel_type: 'Gasolina normal', odometer_from_car: 5, fuel_quantity: 50, total_cost: 100, cost_liter: 2, series_id: 1, car_id: 1)
  Supply.create(fuel_type: 'Gasolina normal', odometer_from_car: 15, fuel_quantity: 50, total_cost: 100, cost_liter: 2, series_id: 2, car_id: 1)

  # t.string   "fuel_type",         null: false
  # t.integer  "odometer_from_car", null: false
  # t.integer  "fuel_quantity",     null: false
  # t.integer  "total_cost",        null: false
  # t.integer  "cost_liter",        null: false
  # t.integer  "series_id",         null: false
  # t.integer  "car_id",            null: false
  # t.datetime "created_at"
  # t.datetime "updated_at"
