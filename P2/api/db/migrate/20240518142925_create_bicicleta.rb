class CreateBicicleta < ActiveRecord::Migration[7.1]
  def change
    create_table :bicicleta do |t|
      t.string :tipo_manillar
      t.string :tipo_frenos
      t.integer :num_frenos
      t.string :tipo_transmision
      t.string :tipo_cuadro
      t.string :tipo_sillin
      t.string :tipo_ruedas
      t.integer :num_ruedas
      t.string :imagen_representativa
      t.string :tipo_bicicleta
      t.string :tipo_suspension, null:true
      t.integer :num_suspensiones, null:true

      t.timestamps
    end
  end
end
