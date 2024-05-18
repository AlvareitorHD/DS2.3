class CreateDecoracions < ActiveRecord::Migration[7.1]
  def change
    create_table :decoracions do |t|
      t.string :extra
      t.references :decora_a, polymorphic: true, null: false

      t.timestamps
    end
  end
end
