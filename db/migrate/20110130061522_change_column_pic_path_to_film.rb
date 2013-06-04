class ChangeColumnPicPathToFilm < ActiveRecord::Migration
  def self.up
    remove_column :film,:pic_path
    add_column :film,:pic_name,:string
  end

  def self.down
    add_column :film,:pic_path,:string
    remove_column :film,:pic_name,:stirng
    
  end
end
