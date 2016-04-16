class AddDoctorIdToPatients < ActiveRecord::Migration
  def up
    add_column :patients, :doctor_id, :integer
  end

  def down
    remove_column :patients, :doctor_id, :integer
  end
end
