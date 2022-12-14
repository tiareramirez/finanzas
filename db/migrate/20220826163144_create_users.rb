class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username
      t.string :password_digest, null: false
      t.string :nombre
      t.string :sut
      t.integer :telefono

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :sut, unique: true
  end
end
