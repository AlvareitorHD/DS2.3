# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Crear una bicicleta de montaña:
Bicicleta.create(
  tipo_manillar: "Manillar de montaña",
  tipo_frenos: "Frenos de disco",
  num_frenos: 2,
  tipo_transmision: "Transmisión de 21 velocidades",
  tipo_cuadro: "Cuadro de aluminio",
  tipo_sillin: "Sillín acolchado",
  tipo_ruedas: "Ruedas de 26 pulgadas",
  num_ruedas: 2,
  imagen_representativa: "../../assets/bici_mon.png",
  tipo_bicicleta: "montana",
  tipo_suspension: "Suspensión delantera",
  num_suspensiones: 1
)

# Crear una bicicleta de carretera:
Bicicleta.create(
  tipo_manillar: "Manillar de carretera",
  tipo_frenos: "Frenos de pinza",
  num_frenos: 2,
  tipo_transmision: "Transmisión de 18 velocidades",
  tipo_cuadro: "Cuadro de carbono",
  tipo_sillin: "Sillín de competición",
  tipo_ruedas: "Ruedas de 700c",
  num_ruedas: 2,
  imagen_representativa: "../../assets/bici_car.png",
  tipo_bicicleta: "carretera"
)