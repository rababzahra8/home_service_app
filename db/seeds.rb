# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
User.create!(
  email: 'admin@test.com',
  name: 'Admin User',
  age: 25, # Set the desired age
  gender: 'male',
  role: 'admin',
  password: '12345678'
  # Set other attributes as needed
)

# Seller User
User.create!(
  email: 'sam@gmail.com',
  name: 'Seller User',
  age: 30, # Set the desired age
  gender: 'female', # Set the desired gender
  role: 'seller',
  password: '12345678'
  # Set other attributes as needed
)

# Customer User
User.create!(
  email: 'cam@gmailcom',
  name: 'Customer User',
  age: 22, # Set the desired age
  gender: 'female', # Set the desired gender
  role: 'customer',
  password: '12345678'
  # Set other attributes as needed
)
