class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|

      t.timestamps null: false
      t.string :name
      t.string :surname
      t.string :password_digest
      t.string :email
    end
  end
end
