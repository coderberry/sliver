class AddLinkTypeToSliver < ActiveRecord::Migration
  def self.up
    add_column :slivers, :link_type, :string
  end

  def self.down
    remove_column :slivers, :link_type
  end
end
