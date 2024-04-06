# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts, dependent: :restrict_with_error

  validates :name, uniqueness: true, presence: true, length: { minimum: 3, maximum: 40 }
end
