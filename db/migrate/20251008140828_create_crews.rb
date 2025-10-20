class CreateCrews < ActiveRecord::Migration[8.0]
  def change
    create_table :crews do |t|
      t.string :name
      t.string :sea
      t.string :island

      t.timestamps
    end
    add_index :crews, :name, unique: true
  end
end
