class CreateDrugPrescriptions < ActiveRecord::Migration
  def change
    create_table :drug_prescriptions do |t|

      t.timestamps null: false
      t.date :date
      t.integer  :dosage
      t.integer  :patient_id
    end
  end
end
