class CreateCategoria < ActiveRecord::Migration[7.0]
  def change
    create_table :categoria do |t|
      t.string :categoria
      t.integer :tipo
      t.string :icono
      t.timestamps
    end
  end
end
