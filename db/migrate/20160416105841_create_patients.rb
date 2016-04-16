class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|

      t.timestamps null: false
      t.string :name
      t.string :surname
      t.string :password_digest
      t.string :birthdate
      t.string :email
    end
  end
end
