# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # validates_presence_of :title, :description, :user_id, :category_id
end
