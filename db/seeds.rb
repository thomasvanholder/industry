require 'faker'
require 'open-uri'

puts "seeds start: #{Time.now}"
Article.destroy_all
Distributor.destroy_all

puts '--------------------------------'
puts 'creating articles'
10.times do
  article = Article.create(
    title: Faker::Marketing.buzzwords,
    content: Faker::Lorem.paragraph(sentence_count: 9)
  )
  # file = URI.open('https://source.unsplash.com/400x300/?article')
  # article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
end
puts "--> #{Article.count} articles created"
puts '--------------------------------'

COUNTRIES = %w[Germany Italy Spain Netherlands Belgium Denmark Sweden Portugal Mexico Iran China USA].freeze

puts 'creating distributors'
COUNTRIES.each do |country|
  Distributor.create(
    name: Faker::Company.name,
    email: Faker::Internet.email,
    website: Faker::Internet.domain_name,
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    address: country
  )
end

puts "--> #{Distributor.count} articles created"
puts '--------------------------------'

puts "seeds end: #{Time.now}"
