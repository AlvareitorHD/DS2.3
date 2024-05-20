class AddDecoracionesToBicicleta < ActiveRecord::Migration[7.1]
  def change
    add_column :bicicleta, :decoraciones, :text, default: '[]'
  end
end
