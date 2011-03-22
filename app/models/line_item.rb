class LineItem < ActiveRecord::Base
  belongs_to :room
  belongs_to :order
end

# == Schema Information
#
# Table name: line_items
#
#  id              :integer(4)      not null, primary key
#  order_id        :integer(4)
#  deal_id         :integer(4)
#  product_id      :integer(4)
#  name            :string(255)
#  quantity        :integer(4)
#  sub_total_price :integer(10)
#  price           :integer(10)
#  present         :boolean(1)
#  style_id        :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

