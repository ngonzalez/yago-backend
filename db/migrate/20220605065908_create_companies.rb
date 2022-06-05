class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :enterprise_number, null: false, unique: true
      t.integer :annual_revenue, null: false, unique: true
      t.string :legal_name, null: false, unique: true
      t.boolean :natural_person, null: false, unique: true, default: true
      t.jsonb :nacebel_codes
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
