# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "destroying all events and users"

Event.destroy_all
User.destroy_all

puts "Every event and user have been deleted"
puts "Creating Nina and Anniversaire de Maman"

nina = User.create(email: "nina@gmail.com", password: "azerty", username: "la Nin'z")

anniversaire_de_maman = Event.create(list: ["Coffret de produits de soin haut de gamme","Abonnement à une box de lecture","Carte cadeau pour une boutique de vêtements tendance","Soin du visage dans un institut de beauté","Sélection de romans à succès"], subject: ["Mode","Lecture","Cosmétique"], budget_min: "50", budget_max: "100", genre: "female", occasion: "Anniversaire", description: "idées cadeaux", event_name: "Anniversaire de Maman", event_date: "04-01-2024", cagnotte_url: "", event_url: "", user: nina, age: "55", lien: "Parent", id: "1")


puts "Nina and Anniversaire de Maman created"
