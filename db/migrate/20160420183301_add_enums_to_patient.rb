class AddEnumsToPatient < ActiveRecord::Migration
  def up
    add_column :patients, :risk, :integer
    add_column :patients, :desired_inr, :integer
    add_column :patients, :initial_dose, :decimal, precision: 3, scale: 1
  end

  def down
    remove_column :patients, :risk, :integer
    remove_column :patients, :desired_inr, :integer
    remove_column :patients, :initial_dose, :decimal, precision: 3, scale: 1
  end
end
