class AddTimsstampToFilm < ActiveRecord::Migration
  def self.up
    add_timestamps :film
  end

  def self.down
    remove_timestamps :film
  end
end
