class Member < ActiveRecord::Migration
  def self.up
    create_table :member do |t|
      t.string :name
      t.string :password
      t.integer :point
      t.timestamps
      t.integer :member_id
      t.index :member_id
      t.integer :order_film_count
      t.boolean :sex, :default=>false  #false man true woman
      t.integer :age
      t.string :address
    end
  end

  def self.down
    drop_table :member
  end
end
