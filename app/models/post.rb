# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: 'posts'

  validates :title, :body, presence: true
  validates :title, length: { in: 5..255 }
  validates :body, length: { in: 5..4000 }
end
