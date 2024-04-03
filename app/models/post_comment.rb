# frozen_string_literal: true

class PostComment < ApplicationRecord
  has_ancestry

  belongs_to :post, inverse_of: 'comments'
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', inverse_of: 'comments'

  validates :content, length: { in: 5..400 }

  default_scope { order(created_at: :desc) }
end
