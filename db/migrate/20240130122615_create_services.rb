# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.string :status
      t.string :comment
      t.integer :price, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
