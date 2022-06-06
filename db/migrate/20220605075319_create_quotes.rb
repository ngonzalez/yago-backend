class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.integer :company_id, null: false, unique: true
      t.boolean :available, null: false, unique: true, default: true
      t.integer :coverage_ceiling, null: false, unique: true
      t.integer :deductible, null: false, unique: true
      t.string :remote_quote_id, null: false, unique: true
      t.jsonb :gross_premiums, null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
