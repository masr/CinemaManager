class AddStatusMember < ActiveRecord::Migration
  def self.up
    add_column :member,:status,:boolean
  end

  def self.down
  remove_column :member,:status
  end
end
