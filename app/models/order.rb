class Order < ActiveRecord::Base
  set_table_name 'order'
  belongs_to :film
  belongs_to :member
end
