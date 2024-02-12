# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :service
  belongs_to :booking

end
