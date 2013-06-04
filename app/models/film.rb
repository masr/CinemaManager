class Film < ActiveRecord::Base
  set_table_name 'film'
  has_many :orders
  has_many :members,:through=>:orders
validates_presence_of :name
  def datetime_str
    Time.at(self.datetime).strftime("%Y-%m-%d   %H:%M")
  end
end
