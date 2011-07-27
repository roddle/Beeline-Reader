class CreateReads < ActiveRecord::Migration
  def self.up
    create_table :reads do |t|
      t.string :name
      t.string :category
      t.text :reading
      t.string :poster
      t.datetime :created_at
      t.datetime :last_read
      t.integer :word_count
      t.integer :total_reads

      t.timestamps
    end
  end

  def self.down
    drop_table :reads
  end
end
