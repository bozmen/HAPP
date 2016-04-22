class AddTheurapyStateToPatient < ActiveRecord::Migration
  def up
    add_column :patients, :therapy_state, :integer
  end

  def down
    remove_column :patients, :therapy_state, :integer
  end
end
