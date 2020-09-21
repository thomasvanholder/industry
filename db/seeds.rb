require 'faker'
require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeds start: #{Time.now}"

Article.destroy_all

10.times do
  article = Article.create(
    title: Faker::Marketing.buzzwords,
    content: Faker::Quote.famous_last_words
  )
  file = URI.open('https://source.unsplash.com/400x300/?article')
  article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
end

puts "#{Article.count} articles created"
puts "seeds end: #{Time.now}"
