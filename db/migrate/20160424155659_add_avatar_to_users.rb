class AddAvatarToUsers < ActiveRecord::Migration
  def up
    add_attachment :patients, :avatar
    add_attachment :doctors, :avatar
  end

  def down
    remove_attachment :patients, :avatar
    remove_attachment :doctors, :avatar
  end
end