# frozen_string_literal: true

class PostComment < ApplicationRecord
  has_ancestry

  belongs_to :post, inverse_of: 'comments'
  belongs_to :user, inverse_of: 'comments'

  validates :content, length: { in: 5..400 }
end
