class CreateReadItems < ActiveRecord::Migration
  def self.up
    create_table :read_items do |t|
      t.integer :beeline_id
      t.integer :chart_id

      t.timestamps
    end
  end

  def self.down
    drop_table :read_items
  end
end
