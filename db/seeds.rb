# frozen_string_literal: true

require 'faker'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create({ email: 'user@mail.com', password: 'secret' })
categories = Category.create(%w[Наука Путешествия Природа Новости].map { |name| { name: } })

posts = []
10.times { posts.push({ title: Faker::Lorem.word, body: Faker::Lorem.paragraph, category: categories.sample, creator: user }) }
Post.create(posts)
