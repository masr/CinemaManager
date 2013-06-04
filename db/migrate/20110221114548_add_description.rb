class AddDescription < ActiveRecord::Migration
  def self.up
    add_column :member,:description,:text
  end

  def self.down
    remove_column :member,:description
  end
end
