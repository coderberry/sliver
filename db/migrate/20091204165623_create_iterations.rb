class CreateIterations < ActiveRecord::Migration
  def self.up
    create_table :iterations do |t|
      t.integer :a
      t.integer :b
      t.integer :c
      t.integer :d
      t.timestamps
    end
  end

  def self.down
    drop_table :iterations
  end
end
