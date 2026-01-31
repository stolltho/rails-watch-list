# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

puts "Creating movies..."
wonder_woman = Movie.create!(
  title: "Wonder Woman 1984",
  overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s",
  poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
  rating: 6.9
)

shawshank = Movie.create!(
  title: "The Shawshank Redemption",
  overview: "Framed in the 1940s for double murder...",
  poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
  rating: 8.7
)

titanic = Movie.create!(
  title: "Titanic",
  overview: "101-year-old Rose DeWitt Bukater tells the story...",
  poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
  rating: 7.9
)

oceans = Movie.create!(
  title: "Ocean's Eight",
  overview: "Debbie Ocean, a criminal mastermind...",
  poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
  rating: 7.0
)

puts "Creating lists..."
drama = List.create!(name: "Drama")
favs = List.create!(name: "All time favs")
girl_power = List.create!(name: "Girl Power")

puts "Creating bookmarks..."
Bookmark.create!(comment: "Recommended by John", movie: titanic, list: favs)
Bookmark.create!(comment: "Superhero movie revisited in 2020", movie: wonder_woman, list: girl_power)
Bookmark.create!(comment: "Spielberg's masterly Oscar-winning drama", movie: shawshank, list: drama)
Bookmark.create!(comment: "2020 release", movie: oceans, list: favs)
Bookmark.create!(comment: "Based on Stephen King's novel", movie: shawshank, list: girl_power)

puts "Finished! Created #{Movie.count} movies, #{List.count} lists and #{Bookmark.count} bookmarks."
