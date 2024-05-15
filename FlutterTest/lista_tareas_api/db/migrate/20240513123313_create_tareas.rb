class CreateTareas < ActiveRecord::Migration[7.1]
  def change
    create_table :tareas do |t|
      t.string :descripcion
      t.boolean :completada
      t.string :usuario

      t.timestamps
    end
  end
end
