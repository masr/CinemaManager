class Film < ActiveRecord::Migration
  def self.up
    create_table :film do |t|
      t.integer :film_id
      t.index :film_id
      t.integer :price
      t.integer :seats_remain
      t.integer :full_seats
      t.string :name
      t.text :description
      t.timestamp
    end

    create_table :order do |t|
      t.integer :order_id
      t.index :order_id
      t.integer :member_id
      t.integer :film_id
      t.integer :seat_num
      t.timestamp
    end
  end

  def self.down
    drop_table :film
    
  end
end
