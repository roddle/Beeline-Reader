class AddEmailToBeelines < ActiveRecord::Migration
  def self.up
    add_column :beelines, :e_mail, :string
  end

  def self.down
    remove_column :beelines, :e_mail
  end
end
