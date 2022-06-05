class CreateNacebelCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :nacebel_codes do |t|
      t.integer :level, null: false, unique: true
      t.string :code, null: false, unique: true
      t.string :parent_code, null: false, unique: true
      t.string :label, null: false, unique: true
      t.index [:code], name: :index_nacebel_codes_on_code
      t.timestamps
    end
  end
end
