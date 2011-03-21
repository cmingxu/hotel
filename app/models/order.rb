class Order < ActiveRecord::Base
end

# == Schema Information
#
# Table name: orders
#
#  id           :integer(4)      not null, primary key
#  order_number :string(255)
#  price        :string(255)
#  state        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

