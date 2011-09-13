class ChangeColumnCreatedInBeelines < ActiveRecord::Migration
  def self.up
    change_column :beelines, :created_at, :datetime, :default => Time.now
  end

  def self.down
    change_column :beelines, :created_at, :datetime
  end
end
