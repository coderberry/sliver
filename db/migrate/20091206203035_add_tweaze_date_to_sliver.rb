class AddTweazeDateToSliver < ActiveRecord::Migration
  def self.up
    add_column :slivers, :tweaze_date, :date
  end

  def self.down
    remove_column :slivers, :tweaze_date
  end
end
