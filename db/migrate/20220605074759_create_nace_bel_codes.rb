class CreateNaceBelCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :nace_bel_codes do |t|
      t.integer :level, null: false, unique: true
      t.string :code, unique: true
      t.string :parent_code, unique: true
      t.string :label_en, unique: true
      t.string :label_de, unique: true
      t.string :label_nl, unique: true
      t.string :label_fr, unique: true
      t.index [:code], name: :index_nacebel_codes_on_code
      t.index [:parent_code], name: :index_nacebel_codes_on_parent_code
      t.timestamps
    end
  end
end
