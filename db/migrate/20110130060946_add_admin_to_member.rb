class AddAdminToMember < ActiveRecord::Migration
  def self.up
    add_column :member ,:is_admin,:boolean,:default=>false
  end

  def self.down
    remove_column :member ,:is_admin
  end
end
