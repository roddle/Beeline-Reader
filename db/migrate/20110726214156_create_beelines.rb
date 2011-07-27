class CreateBeelines < ActiveRecord::Migration
  def self.up
    create_table :beelines do |t|
      t.string :reader
      t.decimal :normal_time, :precision => 8, :scale => 2
      t.decimal :beeline_time, :precision => 8, :scale => 2
      t.integer :rating
      t.integer :flag
      t.references :read

      t.timestamps
    end
  end

  def self.down
    drop_table :beelines
  end
end
