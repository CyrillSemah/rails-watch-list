require 'open-uri'
require 'json'
# Affiche un message pour indiquer la suppression des anciennes données
puts "Clearing old data..."
# Supprime tous les enregistrements de films existants dans la base de données
Movie.destroy_all
# Affiche un message pour indiquer l’insertion de films statiques
puts "Seeding static movies..."
# Définit une liste de films avec des données statiques (titres, résumés, URLs d'affiches, notes)
static_movies = [
  {
    title: "Wonder Woman 1984",
    overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s.",
    poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
    rating: 6.9
  },
  {
    title: "The Shawshank Redemption",
    overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison.",
    poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
    rating: 8.7
  },
  {
    title: "Titanic",
    overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.",
    poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
    rating: 7.9
  },
  {
    title: "Ocean's Eight",
    overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.",
    poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
    rating: 7.0
  }
]
# Parcourt chaque film statique et le crée dans la base de données
static_movies.each do |movie_data|
  Movie.create!(movie_data)
end
# Affiche un message pour confirmer que les films statiques ont été ajoutés
puts "Static movies seeded!"
# Affiche un message pour indiquer la récupération des films depuis l'API TMDB
puts "Fetching and seeding movies from TMDB..."
# Définit l’URL de l’API pour obtenir les films les mieux notés et lit les données
url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)["results"]
# Parcourt chaque film récupéré de l'API et le crée dans la base de données
movies.each do |movie_data|
  Movie.create!(
    title: movie_data["title"],
    overview: movie_data["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie_data['poster_path']}",
    rating: movie_data["vote_average"]
  )
end
# Affiche un message pour confirmer que les films de TMDB ont été ajoutés
puts "Movies from TMDB seeded successfully!"





puts "Cleaning database..."
Movie.destroy_all

puts "Creating movies..."

static_movies = [
{ title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9 },
{ title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7 },
{ title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9 },
{ title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0 }
]

static_movies.each do |movie_data|
  Movie.create!(movie_data)
end
# Affiche un message pour confirmer que les films statiques ont été ajoutés
puts "Static movies seeded!"
# Affiche un message pour indiquer la récupération des films depuis l'API TMDB
puts "Fetching and seeding movies from TMDB..."
# Définit l’URL de l’API pour obtenir les films les mieux notés et lit les données
url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)["results"]
# Parcourt chaque film récupéré de l'API et le crée dans la base de données
movies.each do |movie_data|
  Movie.create!(
    title: movie_data["title"],
    overview: movie_data["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie_data['poster_path']}",
    rating: movie_data["vote_average"]
  )
end
# Affiche un message pour confirmer que les films de TMDB ont été ajoutés
puts "Finished! Created #{Movie.count} movies."
