namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@example.com",
                         password: "example",
                         password_confirmation: "example",
                         admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    movie1 = Movie.create!(name: "The Amazing Spider-Man 2",
                           length: "140",
                           director: "Marc Webb",
                           cast: "Andrew Garfield, Emma Stone",
                           genre: "Action")
    movie2 = Movie.create!(name: "Rio 2",
                           length: "101",
                           director: "Carlos Saldanha",
                           cast: "Anne Hathaway, Jesse Eisenberg, will.i.am",
                           genre: "Animation")
    movie3 = Movie.create!(name: "Neighbors",
                           length: "96",
                           director: "Nicholas Stoller",
                           cast: "Zac Efron, Dave Franco, Rose Byrne, Seth Rogen",
                           genre: "Comedy")
    movies = Movie.all
    50.times do
      content = Faker::Lorem.sentence(5)
      movies.each { |movie| movie.reviews.create!(content: content) }
    end
  end
end