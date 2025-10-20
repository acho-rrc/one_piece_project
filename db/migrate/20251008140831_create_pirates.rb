class CreatePirates < ActiveRecord::Migration[8.0]
  def change
    create_table :pirates do |t|
      t.string :name
      t.string :role
      t.bigint :bounty
      t.references :crew, null: false, foreign_key: true
      t.string :devil_fruit
      t.text :quote

      t.timestamps
    end
  end
end
