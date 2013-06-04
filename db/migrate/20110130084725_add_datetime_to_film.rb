class AddDatetimeToFilm < ActiveRecord::Migration
  def self.up
    add_column :film,:datetime,:integer
  end

  def self.down
    remove_column :film,:datetime
  end
end
