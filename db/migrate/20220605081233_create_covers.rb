class CreateCovers < ActiveRecord::Migration[7.0]
  def change
    create_table :covers do |t|
      t.integer :quote_id, null: false, unique: true
      t.string :name, null: false, unique: true
      t.integer :amount, null: false, unique: true
      t.timestamps
    end
  end
end
