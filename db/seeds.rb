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

users = User.create([{ email: 'user@mail.com', password: 'secret' }, { email: 'another_user@mail.com', password: 'secret' }])
categories = Category.create(%w[Наука Путешествия Природа Новости].map { |name| { name: } })
posts = Post.create([
                      {
                        title: 'Что такое криптография?',
                        body: 'Это может быть не очевидно, но мы сталкиваемся с криптографией каждый день. Например, когда мы оплачиваем покупки картой, смотрим видео на YouTube или заправляем машину, криптография защищает нашу информацию. Может показаться, что криптография – это удел разработчиков, хакеров и корпораций, а простому пользователю знать о ней вовсе не обязательно. Однако это полезно не только узким специалистам, но и всем, кто заботится о собственной безопасности. Этот гайд поможет разобраться, что такое криптография и какое применение она находит в повседневной жизни.',
                        category: categories.first,
                        creator: users.first
                      },
                      {
                        title: 'Что такое динамическое программирование',
                        body: 'Работу разработчика часто можно сравнить с решением головоломок. Как в настоящей головоломке, разработчику приходится тратить существенные ресурсы не столько на реализацию конкретного решения, сколько на выбор оптимального подхода. Иногда задача решается легко и эффективно, а порой — только полным перебором всех возможных вариантов. Такой подход часто называют наивным решением. Он имеет существенный минус — временные затраты.

                        Представим хакера, который пытается взломать какой-то пароль перебором всех комбинаций символов. Если пароль допускает 10 цифр, 26 маленьких букв, 26 больших букв и 32 специальных символа (например, значок доллара), то для каждого символа в пароле есть 94 кандидата. Значит, чтобы взломать перебором пароль, состоящий из одного символа, потребуется 94 проверки. Если в пароле два символа — 94 кандидата на первую позицию, 94 кандидата на вторую позицию — то придется перебрать аж 94*94 = 8836 возможных пар. Для пароля из десяти символов потребуется уже перебор 94^10 комбинаций.',
                        category: categories.second,
                        creator: users.second
                      }
                    ])
comments = PostComment.create([
                                { content: 'root comment', post: posts.first, user: users.first },
                                { content: 'root comment', post: posts.first, user: users.second }
                              ])
nested_comments = comments.first.children.create([
                                                   { content: 'nested comment', post: posts.first, user: users.second },
                                                   { content: 'nested comment', post: posts.first, user: users.second }
                                                 ])
nested_comments.first.children.create([
                                        { content: 'deep nested comment', post: posts.first, user: users.first }
                                      ])
