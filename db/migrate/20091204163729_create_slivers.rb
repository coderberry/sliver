class CreateSlivers < ActiveRecord::Migration
  def self.up
    create_table :slivers do |t|
      t.string :long_url
      t.string :mini_key
      t.string :email
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :slivers
  end
end
