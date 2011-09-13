class FixReadItemsColumnNameBeelineId < ActiveRecord::Migration
  def self.up
    rename_column :read_items, :reading_id, :beeline_id
  end

  def self.down
  end
end
