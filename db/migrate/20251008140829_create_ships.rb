class CreateShips < ActiveRecord::Migration[8.0]
  def change
    create_table :ships do |t|
      t.string :name
      t.references :crew, index: {unique: true}, null: false, foreign_key: true
      t.string :location

      t.timestamps
    end
    add_index :ships, :name, unique: true
  end
end
