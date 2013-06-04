class ChangeAllId < ActiveRecord::Migration
  def self.up
    remove_column :film ,:film_id
    remove_column :order,:order_id
    remove_column :member,:member_id
  end

  def self.down
    add_column :film,:film_id,:integer
    add_column :order,:order_id
    add_column :member,:member_id
    add_index :film ,:film_id
    add_index :order ,:order_id
    add_index :member,:member_id
  end
end
