# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Manga.destroy_all

require 'uri'
require 'net/http'
require 'json'

# Liste d'ID d'anime à récupérer
anime_ids = [1, 14790, 13 #2, 11, 25, 58, 9, 3, 4, 14, 17, 20, 21, 22, 24, 29, 30, 31, 33, 35, 36, 37, 38,
  ]  # Ajoutez autant d'ID que vous le souhaitez

# Configuration de l'URL de l'API
url_base = "https://myanimelist.p.rapidapi.com/manga/"
api_key = ENV['RAPIDAPI_KEY']

# Boucle pour récupérer les détails de chaque anime
anime_ids.each do |anime_id|
  url = URI("#{url_base}#{anime_id}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["X-RapidAPI-Key"] = api_key
  request["X-RapidAPI-Host"] = 'myanimelist.p.rapidapi.com'

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)
    anime_data = JSON.parse(response.body)
    puts "Structure des données : #{anime_data}"


    # puts "Anime Data: #{anime_data.inspect}" # Ajoutez cette ligne pour afficher les données de l'anime


  # Utilisez les données récupérées pour créer un nouvel anime dans votre base de données

    Manga.create!(
      nom: anime_data['title_ov'],
      synopsys: anime_data['synopsis'],
      auteur: anime_data['information']['authors'][0]['name'],
      statut: anime_data['information']['status'],
      note_moyenne: anime_data['statistics']['score'],
      couverture: anime_data['picture_url'],
      volume: anime_data['information']['volumes'],
      chapitre: anime_data['information']['chapters']
    )
    puts "Structure des données : #{anime_data}"
# puts "Volumes : #{anime_data['information']['type'][0]['volumes']}"
# puts "Chapitres : #{anime_data['information']['type'][0]['chapters']}"

  else
    puts "Erreur lors de la récupération des données pour l'anime #{anime_id}."
  end
end
