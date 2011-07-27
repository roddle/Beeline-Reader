class AddFieldnameToTablename < ActiveRecord::Migration
  def self.up
    add_column :reads, :word_count, :integer
  end

  def self.down
    remove_column :reads, :word_count
  end
end
