# frozen_string_literal: true

class User < ApplicationRecord
  enum gender: { male: 'Male', female: 'Female', other: 'Other' }
  enum role: { admin: 'Admin', seller: 'Seller', customer: 'Customer' }

  validates :role, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable

  has_many :services, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
