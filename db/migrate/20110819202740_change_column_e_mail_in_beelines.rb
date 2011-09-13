class RenameColumnEMailInBeelines < ActiveRecord::Migration
  def self.up
    rename_column :beelines, :e_mail, :user_id
  end

  def self.down
    rename_column :beelines, :user_id, :e_mail
  end
end
