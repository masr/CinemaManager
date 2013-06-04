class AlterFilm < ActiveRecord::Migration
  def self.up
    add_column :film,:pic_path,:string
  end

  def self.down
    remove_column :film,:pic_path
  end
end
