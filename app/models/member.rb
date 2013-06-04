class Member < ActiveRecord::Base
  set_table_name "member"
  has_many :orders
  has_many :films ,:through=>:orders
end
