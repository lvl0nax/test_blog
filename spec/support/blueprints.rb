
require 'machinist/active_record'

Article.blueprint do
  body { Faker::Lorem.sentences(3).join(' ') }
  title { Faker::Lorem.sentences(1).first }
end

Comment.blueprint do
  body { Faker::Lorem.sentences(3).join(' ') }
  article { Article.make! }
  author_name { Faker::Lorem.word }
end

Subscription.blueprint do
  email { Faker::Internet.email }
end
