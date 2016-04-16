class CreateInrRecords < ActiveRecord::Migration
  def change
    create_table :inr_records do |t|

      t.timestamps null: false
      t.date :date
      t.decimal  :inr_value, precision: 3, scale: 1
      t.integer  :patient_id
    end
  end
end
