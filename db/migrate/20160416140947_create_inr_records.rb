class CreateInrRecords < ActiveRecord::Migration
  def change
    create_table :inr_records do |t|

      t.timestamps null: false
      t.datetime :date
      t.datetime :value
      t.integer  :patient_id
    end
  end
end
