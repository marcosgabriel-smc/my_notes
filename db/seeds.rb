# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# CLEAN DB
######################################################################
puts 'Cleaning the database...'
Post.destroy_all
User.destroy_all
Category.destroy_all

# USERS
######################################################################
puts 'Creating user...'
User.create!(
  {
    first_name: 'Marcos',
    last_name: 'Gabriel',
    password: '123456',
    email: 'marcos@blog.com',
    admin: true
  }
)

# CATEGORIES

Category.create!(name: "Javascript")
Category.create!(name: "Ruby")
Category.create!(name: "PHP")
Category.create!(name: "Vue")
Category.create!(name: "React")

# POSTS
######################################################################
puts 'Creating some posts...'
15.times do
  Post.create!(
    {
      title: Faker::Book.title,
      subtitle: Faker::Quote.matz,
      date: Date.today,
      user: User.last,
      category: Category.all.sample,
      content: Faker::Lorem.paragraph(sentence_count: 30, supplemental: true, random_sentences_to_add: 50),
      public: true
    }
  )
end

5.times do
  Post.create!(
    {
      title: Faker::Book.title,
      subtitle: Faker::Quote.matz,
      date: Date.today,
      user: User.last,
      category: Category.all.sample,
      content: Faker::Lorem.paragraph(sentence_count: 30, supplemental: true, random_sentences_to_add: 50),
      public: false
    }
  )
end

#####################################################################
puts 'Finished!'
