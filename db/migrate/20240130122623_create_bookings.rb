# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.string :status, null: false, default: 'pending'

      t.timestamps
    end
  end
end
