class AddNombreUsuarioToBicicleta < ActiveRecord::Migration[7.1]
  def change
    add_column :bicicleta, :nombre_usuario, :string
  end
end
