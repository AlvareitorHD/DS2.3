class Bicicleta < ApplicationRecord
    # Antes del guardado, serializar las decoraciones a JSON
    before_save :serialize_decoraciones
  
    # Método para serializar
    def serialize_decoraciones
      self.decoraciones = decoraciones.to_json
    end
  
    # Método para deserializar
    def decoraciones
      JSON.parse(read_attribute(:decoraciones) || '[]')
    end
  end
