class CreateIngresos < ActiveRecord::Migration[7.0]
  def change
    create_table :ingresos do |t|
      t.integer :id_categoria
      t.date :fecha
      t.float :monto
      t.string :comentario
      t.integer :tipo

      t.timestamps
    end
  end
end
